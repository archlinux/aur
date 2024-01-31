# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.7.0
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
    "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
    "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
  )
arch=('x86_64')
sha512sums=('077a01e6f757a3ed8800694555c924046571a9c46c568d7e32a01918c98581c1053a4630aa231ca5fd243fa1405d91c1106ffc95a0eb333e419033035145c6d7'
            'bb0583a89b12a70d54896a7cd05c4bdefc67127b171028e0be4fbf9d2ab1a862858c754cb960e9c7047c8b26de83f8967d0f83f89c63a2789e7bfaeed4c96dd8')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  mkdir -p $pkgdir/etc/$_pkgname/cfg
  cp -r $srcdir/cfg $pkgdir/etc/$_pkgname/
  chmod -R 0755 $pkgdir/etc/$_pkgname/cfg
  install -D -m 0755 $srcdir/config.yaml $pkgdir/etc/$_pkgname/cfg/config.yaml
  $pkgdir/usr/bin/$_pkgname completion zsh > $srcdir/zsh_$_pkgname
  $pkgdir/usr/bin/$_pkgname completion bash > $srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh
