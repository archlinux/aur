# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.6.8
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
    "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
    "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
  )
arch=('x86_64')
sha512sums=('88af9a7917e37028fb1aa0785c33f266e4d837719c3b748ef992bed95892006c21ac4514eac02d7895727797950c8bbb57e4fd00ba8c275c402d008f6516d56d'
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
