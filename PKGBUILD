# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
# Contributor: DeepSeek (https://deepseek.com/)
# Contributor: ChatGPT by OpenAI (https://openai.com/)
pkgname='bashdev'
pkgver=0.3.1
pkgrel=2
pkgdesc="A library of reusable Bash functions for script developers."
arch=('any')
url="https://github.com/TomB19/$pkgname"
license=('MIT')
depends=('bash' 'github-cli')
makedepends=('git')
source=("git+https://github.com/TomB16/$pkgname.git#branch=master")
sha256sums=('1d979a85b267c3a2edce8f3584a179e99421d7fd89e22ce5f7c55f0474d69f8b')

package() {
  cd "$srcdir/$pkgname" || return 1

  # Install scripts
  for f in src/*; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$(basename "$f")"
  done

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$pkgname" || exit 1

  if [[ ! -f VERSION ]]; then
    echo "VERSION file not found"
    exit 1
  fi

  cat VERSION
}
