# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=bpftool-bin
pkgver=7.3.0
pkgrel=1
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
b2sums=('653ecbe71c35b59fbea347771a714158bf914335d419c40bffe69d18b2cbb07a9f0654fb97d49755e543d6a8c0b3a7f0c9123a170f6e492da8d5b3f45b4afc0a')
b2sums_x86_64=('5a7da1c466974844ae91f1bd25258708bb62169f924a73751f4467fb51f6a46c73ac65d72b54c5ad0f9236c16235f44736daf356da4cdf93ee71dde1bb634792')
b2sums_aarch64=('1c30c45fe3b12460d9c255520946d55a60741f54c4c4b0147f7a63e460ec542d656651566354387be5c87982f103253bf471b671cba90751cd28f78a23e5ed28')

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
