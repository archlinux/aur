# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.6.10
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
    "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
    "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
  )
arch=('x86_64')
sha512sums=('f89a4fd3516f78fb9f988ee801ea82153135030a4b4d230b0a4b79e71232eb2b17de3ef472afdb49198164af40df21f5226e49685b558a1c5eeaca6e43981257'
            '755c79f648c2fe3fdaa7e333dcca63d9b9869db970e7c3b3c06ff3971fac2902cba7fd26da8c586e3f1b1e9e893a9ad8fc0fb5623c0ce04fca8661e50bfa95cb')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  mkdir -p $pkgdir/etc/$_pkgname/cfg
  cp -r $srcdir/cfg $pkgdir/etc/$_pkgname/
  chmod -R 0755 $pkgdir/etc/$_pkgname/cfg
  install -D -m 0755 $srcdir/config.yaml $pkgdir/etc/$_pkgname/cfg/config.yaml
}

#vim: syntax=sh
