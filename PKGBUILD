# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.6.9
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
    "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
    "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
  )
arch=('x86_64')
sha512sums=('7db5b28702b46201e85bac2778a7c7b6adbb9390c31f5c046fbdf178d95e596e7b03ba5452fee13eacab4111eea4e5463e0c26ba5100ced9c1ce27bb8bb3ea03'
            '21d67c4106d74fe1557cbf790d28a3742034fb14cf51591d905c665865c76fdf4a69e1e1615e9d550eedda84737f7dbc7b7a3eafc63a8c75ebc5101760d7faee')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  mkdir -p $pkgdir/etc/$_pkgname/cfg
  cp -r $srcdir/cfg $pkgdir/etc/$_pkgname/
  chmod -R 0755 $pkgdir/etc/$_pkgname/cfg
  install -D -m 0755 $srcdir/config.yaml $pkgdir/etc/$_pkgname/cfg/config.yaml
}

#vim: syntax=sh
