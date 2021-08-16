# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=1.2.2
pkgrel=1
pkgdesc="ArcHlinux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools' 'git' 'pyalpm' 'python-aur' 'python-srcinfo')
makedepends=('python-pip')
optdepends=('breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'gnupg: package and repository sign'
            'mercurial: -hg packages support'
            'python-aiohttp: web server'
            'python-aiohttp-jinja2: web server'
            'python-boto3: sync to s3'
            'python-jinja: html report generation'
            'rsync: sync by using rsync'
            'subversion: -svn packages support')
source=("https://github.com/arcan1s/ahriman/releases/download/$pkgver/$pkgname-$pkgver-src.tar.xz"
        'ahriman.sysusers'
        'ahriman.tmpfiles')
backup=('etc/ahriman.ini'
        'etc/ahriman.ini.d/logging.ini')

build() {
  cd "$pkgname"

  python setup.py build
}

package() {
  cd "$pkgname"

  python setup.py install --root="$pkgdir"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha512sums=('45e1266baaf39ff65f36efac9fab78010f4c920ee086e3e54c764bda157af88f74ff5b4a596510af5ef7c1c10603662bdf7718b592bc26066ec70be5a0ed43fc'
            '13718afec2c6786a18f0b223ef8e58dccf0688bca4cdbe203f14071f5031ed20120eb0ce38b52c76cfd6e8b6581a9c9eaa2743eb11abbaca637451a84c33f075'
            'a60d8d4bb8bf224e874be3bf158f2fb8e3ad0e23b69c2bf4e33a96d5d02d324bb800a11df1f3683112810674a5f29383ee0ccbc1077bcbdc946cc72bc441ff04')
