# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=tscrape
pkgver=0.6+r4+g291870a
pkgrel=1
pkgdesc='Twitter scraper'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://codemadness.org/tscrape.html'
_url_source='https://codemadness.org/releases/tscrape'
license=('ISC')
_commit=291870afea3ad56366e82efaceef0f1288b34018 # latest commit with updated static bearer token
source=("git://git.codemadness.org/tscrape#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  git -C "${pkgname}" describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  make -C "${pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}" install
  install -Dvm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
