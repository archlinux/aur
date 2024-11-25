# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.9.2
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
)
arch=('x86_64')
sha512sums=('7e095c05dcbba3677d4ccdc500ad998ad798aeee3c5ab783642923a1fe63627b2a0a83200bf5270f459f2a3b4f04e1983f495d8d08341fe7a2060d3ef6bfd435'
            '15313340ad6a562a45902dc501bab6c9165f18c7f569223282703e758304e0f2d32c6b73f34ef6286a1ee10b3f1f487bd8cbe0bc1caba9cfa14b68bc97a1d6e2')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  mkdir -p $pkgdir/etc/$_pkgname/cfg
  cp -r $srcdir/cfg $pkgdir/etc/$_pkgname/
  chmod -R 0755 $pkgdir/etc/$_pkgname/cfg
  install -D -m 0755 $srcdir/config.yaml $pkgdir/etc/$_pkgname/cfg/config.yaml
  $pkgdir/usr/bin/$_pkgname completion zsh >$srcdir/zsh_$_pkgname
  $pkgdir/usr/bin/$_pkgname completion bash >$srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh
