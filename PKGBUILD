# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-bench
pkgname=$_pkgname-bin
pkgver=0.15.6 # renovate: datasource=github-releases depName=aquasecurity/kube-bench
pkgrel=1
pkgdesc="Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark"
url="https://github.com/aquasecurity/$_pkgname"
license=('Apache-2.0')
source=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/aquasecurity/kube-bench/v$pkgver/cfg/config.yaml"
)
arch=('x86_64')
sha512sums=('0a41492ad00e6f574dfcb2ed33b2e1efbd333c09b4417a83d59a98b1f348628fc357501a24f240c9f325765fc6a125bf5df4498b25010dfdf26cf3187316c151'
            'aea8fa6f2a88c37c063f6a87baf2996ebf802c764d217df3eb6d6c3296d0c5621d73290c2ae868edecf180e2ac6d75adbc42ab77ab54220c37377210c2d75f58')
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
