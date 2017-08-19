# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=Pokemon-Terminal
pkgname=pokemon-terminal-git
pkgver=r286.854ae82
pkgrel=1
pkgdesc="Pokemon terminal themes"
arch=('any')
url="https://github.com/LazoCoder/$_gitname"
license=('GPL3')
depends=('python>=3.5')
optdepends=('gnome-shell: support changing GNOME wallpaper'
            'terminology: support changing Terminology background'
            'tilix: support changing Tilix background')
makedepends=('git' 'perl')
source=("https://github.com/LazoCoder/$_gitname/archive/master.zip" "get-commit-count.pl")
sha256sums=('SKIP' '6d4cc3bfb1f1b737c2f6ea1fac66302028f887056d0183b4c8ae2ed89ae70ef8')

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(curl --silent https://github.com/$_gitname/Pokemon-Terminal | ./get-commit-count.pl)" "$(git ls-remote https://github.com/LazoCoder/$_gitname.git refs/heads/master | cut -c1-7)"
}

package() {
  cd "$srcdir/$_gitname-master"

  rm .npmignore .gitignore LICENSE package.json README.md unittest.py .travis.yml test_* load_all_pokemon.py
  rm -r Samples/

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
