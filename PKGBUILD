# Maintainer: Mike Williamson <mike at korora dot ca>

pkgname=kube-bench
pkgver=0.0.22
pkgrel=1
pkgdesc="Checks whether Kubernetes is deployed according to security best practices"
arch=('x86_64' 'i686')
url="https://github.com/aquasecurity/kube-bench"
license=('APACHE')
makedepends=('go' 'dep')
options=('!strip' '!emptydirs')
source=("https://github.com/aquasecurity/kube-bench/archive/v$pkgver.tar.gz")
md5sums=('ca99b47218a4d431aeeceeb22fc4ae2f')

build() {
  mkdir "$srcdir/src"
  mv "$srcdir/kube-bench-$pkgver" "$srcdir/src"
  cd "$srcdir/src/kube-bench-$pkgver"
  GOPATH="$srcdir" dep ensure
  GOPATH="$srcdir" make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m 755 "$srcdir/src/kube-bench-$pkgver/kube-bench" "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/src/kube-bench-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
