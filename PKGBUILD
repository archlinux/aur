# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=1.0.0
pkgrel=1
pkgdesc="ArcHlinux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools' 'git' 'pyalpm' 'python-aur' 'python-srcinfo')
makedepends=('python-pip')
optdepends=('aws-cli: sync to s3'
            'breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'gnupg: package and repository sign'
            'mercurial: -hg packages support'
            'python-aiohttp: web server'
            'python-aiohttp-jinja2: web server'
            'python-jinja: html report generation'
            'rsync: sync by using rsync'
            'subversion: -svn packages support')
source=("https://github.com/arcan1s/ahriman/releases/download/$pkgver/$pkgname-$pkgver-src.tar.xz"
        'ahriman.sysusers'
        'ahriman.tmpfiles')
sha512sums=('5c01e567c86e66100dd5819364045f0e605d1b3ff474b883394e5a7532885f718f3f80dd138e4ebc84330fb8cb5a85bf3e065836324f8f7855c40895d9b4af11'
            '13718afec2c6786a18f0b223ef8e58dccf0688bca4cdbe203f14071f5031ed20120eb0ce38b52c76cfd6e8b6581a9c9eaa2743eb11abbaca637451a84c33f075'
            '55b20f6da3d66e7bbf2add5d95a3b60632df121717d25a993e56e737d14f51fe063eb6f1b38bd81cc32e05db01c0c1d80aaa720c45cde87f238d8b46cdb8cbc4')
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
