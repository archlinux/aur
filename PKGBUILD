# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=bpftool-bin
pkgver=7.2.0
pkgrel=2
pkgdesc='bpftool is a tool for inspection and simple manipulation of eBPF programs and maps'
url='https://github.com/libbpf/bpftool'
source=("https://github.com/libbpf/bpftool/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("https://github.com/libbpf/bpftool/releases/download/v$pkgver/bpftool-v$pkgver-amd64.tar.gz")
source_aarch64=("https://github.com/libbpf/bpftool/releases/download/v$pkgver/bpftool-v$pkgver-arm64.tar.gz")
arch=('x86_64' 'aarch64')
makedepends=('python-docutils')
provides=('bpftool')
conflicts=('bpftool')
license=('GPL2')
changelog=CHANGELOG
b2sums=('b74cf49cd30b67c474cfd3a842110180a179f0dfe0d6921fc4bf35f5c7ed50659dd75ad06aaa92bcff865a49b862697bc5f494c6d7a5d458eb80e5232e673875')
b2sums_x86_64=('30dcd2127a7d6a0a6b15140d2d849fe4548b8ea7c177607e00780ce8b25d307fa80f4f1414fbc79a3ea378f2d34cc4229b2ab29f9c7b8399dafe06bee7e60875')
b2sums_aarch64=('bd6d0d3dce357a25279d995b8744519c9d78744dc207afb66c60805b1264838a701c786e1ba7686a433e383b9f00d43586d8bf767e31564ba00d486ed068851d')

package() {
  # Copy the main binary
  cd "$srcdir"
  install -Dm755 bpftool "$pkgdir/usr/bin/bpftool"

  # Bash completions
  cd "bpftool-$pkgver"
  install -Dm644 bash-completion/bpftool "$pkgdir/usr/share/bash-completion/completions/bpftool"

  # Man pages
  cd "docs"
  make
  install -Dm644 -t "$pkgdir/usr/share/man/man8" *.8
}
