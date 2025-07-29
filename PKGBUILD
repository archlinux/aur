# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=tetragon
pkgname=$_pkgname-bin
pkgver=1.5.0 # renovate: datasource=github-releases depName=cilium/tetragon
pkgrel=1
pkgdesc="eBPF-based Security Observability and Runtime Enforcement"
url="https://github.com/cilium/$_pkgname"
license=('Apache-2.0')
arch=('x86_64')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/tetragon-cli/${_pkgname}-linux-amd64.tar.gz")
sha512sums=('e0056b6497a95dcd97db70b0cb3140f12a833b29274006927e1d3b8f2dc638f9154bc252d322922844752dd0a0fb60732282592fc294afa51b359d2110f7770a')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  tar -xz -C $srcdir -f $_pkgname-$pkgver.tar.gz
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
  $pkgdir/usr/bin/$_pkgname completion zsh >$srcdir/zsh_$_pkgname
  $pkgdir/usr/bin/$_pkgname completion bash >$srcdir/bash_$_pkgname
  install -D -m 0644 $srcdir/zsh_$_pkgname $pkgdir/usr/share/zsh/site-functions/_$_pkgname
  install -D -m 0644 $srcdir/bash_$_pkgname $pkgdir/usr/share/bash-completion/completions/$_pkgname
}

#vim: syntax=sh
