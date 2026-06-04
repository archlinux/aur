# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>

pkgname=zsh-ai-git
_pkgname=${pkgname::-4}
pkgver=r145.7375e30
pkgrel=1
pkgdesc="Transform natural language into shell commands instantly via zsh plugin"
arch=('any')
url="https://github.com/matheusml/zsh-ai"
license=('MIT')
depends=('zsh>=5.0' 'curl' 'perl')
optdepends=('jq: improved JSON parsing')
makedepends=('git')
source=("git+https://github.com/matheusml/zsh-ai.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  install -Dm644 "zsh-ai.plugin.zsh" -t "$pkgdir/usr/share/zsh/plugins/$_pkgname"

  for f in lib/*.zsh; do
    install -Dm644 "$f" -t "$pkgdir/usr/share/zsh/plugins/$_pkgname/lib/"
  done
  for f in lib/providers/*.zsh; do
    install -Dm644 "$f" -t "$pkgdir/usr/share/zsh/plugins/$_pkgname/lib/providers/"
  done

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
