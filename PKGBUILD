# Maintainer: nizne <nizne@tutamail.com>
pkgname=pwdsafety
pkgver=0.4.0
pkgrel=1
pkgdesc='Command line tool that checks how much a password is safe'
arch=('x86_64' 'aarch64' 'i686') # I'm not sure if the 'arm' in the repository refers to 'armv7h.'
url='https://github.com/edoardottt/pwdsafety'
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
provides=("pwdsafety")
conflicts=("pwdsafety-bin" "pwdsafety-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/edoardottt/pwdsafety/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('abbc499bd592fe6983bb2f47a5f5b69d54ab5c5bbfb9097b27d2888d32f2bdd2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make dep
  go build -o "$pkgname" ./cmd/pwdsafety
}

package() {
  install -Dm755 "${srcdir}/$pkgname-$pkgver/pwdsafety" "${pkgdir}/usr/bin/pwdsafety"
}
