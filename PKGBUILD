# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=1.4.1
pkgrel=1
pkgdesc="ArcH Linux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools' 'git' 'pyalpm' 'python-aur' 'python-passlib' 'python-srcinfo')
makedepends=('python-pip')
optdepends=('breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'gnupg: package and repository sign'
            'mercurial: -hg packages support'
            'python-aioauth-client: web server with OAuth2 authorization'
            'python-aiohttp: web server'
            'python-aiohttp-debugtoolbar: web server with enabled debug panel'
            'python-aiohttp-jinja2: web server'
            'python-aiohttp-security: web server with authorization'
            'python-aiohttp-session: web server with authorization'
            'python-boto3: sync to s3'
            'python-cryptography: web server with authorization'
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

sha512sums=('c79b58554eff59256bf0ac81c400f244c5a474fbaf7bbfcb739872acae863a523981f4850fc4fd2cc822077a7c5ceee214566c30522bb8a7e2326e5a89d1c16b'
            '13718afec2c6786a18f0b223ef8e58dccf0688bca4cdbe203f14071f5031ed20120eb0ce38b52c76cfd6e8b6581a9c9eaa2743eb11abbaca637451a84c33f075'
            'a60d8d4bb8bf224e874be3bf158f2fb8e3ad0e23b69c2bf4e33a96d5d02d324bb800a11df1f3683112810674a5f29383ee0ccbc1077bcbdc946cc72bc441ff04')
