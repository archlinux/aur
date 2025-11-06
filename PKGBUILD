# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.14.0 # renovate: datasource=github-releases depName=aquasecurity/kube-bench
pkgrel=1
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
)
arch=('x86_64')
sha512sums=('a25e24c10100bbec49ee31f75019e7bb4570ad382d9864f292265fbf97a55784f0fdcb1161ef71744fefdb5a688a58796bf1a512d86acbed08d397187844787f'
            'ab1a4b5f8361b402efbd522caa3227e3a8b744ec68b62a71f9693760deeb8c4708a9c09b2e954a8125658c1a41e6bda8778cb5cf627737414188c0acbb537cd8')
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
