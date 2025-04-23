# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.10.5
pkgrel=0
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('APACHE')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
)
arch=('x86_64')
sha512sums=('1ad1b6fc08ff4b48ff7ebc64bd6615452c512f9dab4b3d786cdfc34e3ed04707ce4b31b8d2f576e2d4ee97a8204ee2243df51f23d0ccff030bdeac41a22cf1f9'
            '8bb28f7c23084b888ea131b7ba1fea3baf00f5509cbb99b6b7d5fef4cb70db0cd6bdc32e0bdd07eb2926a99c08ce4a0d0937f1d894b3a7a01e49cd9213744b43')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  mkdir -p "$pkgdir/etc/$_pkgname/cfg"
  cp -r "$srcdir/cfg" "$pkgdir/etc/$_pkgname/"
  chmod -R 0755 "$pkgdir/etc/$_pkgname/cfg"
  install -D -m 0755 "$srcdir/config.yaml" "$pkgdir/etc/$_pkgname/cfg/config.yaml"
  "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
  install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

#vim: syntax=sh
