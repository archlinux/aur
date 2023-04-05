# Maintainer: mmxgn <eruyome@gmail.com>

pkgname=gpt4all-git
_commit=1eeaa5c8eee2a1ced12c0756ee05a6139d8d5eb3
pkgver=r153.1eeaa5c
pkgrel=1
epoch=
pkgdesc="Assistant-style Chatbot with Large Scale Data Distillation from GPT-3.5-Turbo"
arch=('x86_64')
url="https://github.com/nomic-ai/gpt4all"
license=('Unlicensed')
depends=('bash')
optdepends=('aria2: for downloading models using magnet links')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("gpt4all-repo::git+https://github.com/nomic-ai/gpt4all.git#commit=${_commit}"
         "gpt4all")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/gpt4all-repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/gpt4all-repo"
}

build() {
  # No build step is necessary for this package
  return 0
}

package() {
  cd "$srcdir/gpt4all-repo"

  # Install the binary
  install -Dm755 "$srcdir/gpt4all-repo/chat/gpt4all-lora-quantized-linux-x86" "$pkgdir/usr/lib/gpt4all/gpt4all-lora-quantized-linux-x86"

  # Install the wrapper script
  install -Dm755 "$srcdir/gpt4all" "$pkgdir/usr/bin/gpt4all"
}

