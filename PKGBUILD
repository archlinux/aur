# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.16.0 # renovate: datasource=github-releases depName=aquasecurity/kube-bench
pkgrel=1
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
)
arch=('x86_64')
sha512sums=('a7cef26fc131f64ba2c147e4e5723248e26eea5d6e2500a72a0d8a2d5e696a0b79f8ce86d4443bf94cc56eba94b6b7662fe9939005bf58d0c4072e60f2b1f8c9'
            'f7649312685889eb8be60743367a00d41b993588005080223cfb9866ee05e803c1d3a3226406130de7c324f1d93cc24a05aecabbd1e06a2da067324b7e59f6ae')
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
