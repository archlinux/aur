
pkgname=innex-git
pkgver=0.6.0.11.g1247890
pkgver() {
  cd inno
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc zlib)
makedepends=(git rust pkgconf)
conflicts=(innex)
provides=(innex)
source=("git+${url}")
b2sums=('SKIP')

build(){
  cd inno
  cargo build --release
}

package(){
  cd inno
  install -Dm755 target/release/innex -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE-{APACHE,MIT}.md -t "$pkgdir"/usr/share/licenses/${pkgname}
}
