# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=Pokemon-Terminal
pkgname=pokemon-terminal-git
pkgver=r301.8085a41
pkgrel=1
pkgdesc="Pokemon terminal themes"
arch=('any')
url="https://github.com/LazoCoder/$_gitname"
license=('GPL3')
depends=('python>=3.5')
optdepends=('gnome-shell: support changing GNOME wallpaper'
            'terminology: support changing Terminology background'
            'tilix: support changing Tilix background')
makedepends=('git' 'jq' 'curl')
source=("https://github.com/LazoCoder/$_gitname/archive/master.zip" "get-commit-count.sh")
sha256sums=('SKIP' '714f2e21a5b77d8b72d6f75da1f1c2fac93f15e2ddd3829a3fbd6dc7307779d0')

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(./get-commit-count.sh)" "$(git ls-remote https://github.com/LazoCoder/$_gitname.git refs/heads/master | cut -c1-7)"
}

package() {
  cd "$srcdir/$_gitname-master/pokemonterminal"

  rm load_all_pokemon.py

  IFS=$'\n'
  for file in `find -type f`
  do
    install -Dm 644 "$file" "${pkgdir}/opt/pokemon-terminal/$file"
  done

  chmod 755 "${pkgdir}/opt/pokemon-terminal/main.py"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/pokemon-terminal/main.py" "${pkgdir}/usr/bin/pokemon"
  ln -s "/opt/pokemon-terminal/main.py" "${pkgdir}/usr/bin/ichooseyou"
}
