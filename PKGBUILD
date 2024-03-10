# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=neovim-ultisnips
pkgver=3.2
pkgrel=1
pkgdesc='TextMate-style snippets for Neovim.'
arch=('any')
url='https://github.com/SirVer/ultisnips'
license=('GPL3')
depends=('neovim' 'python-neovim')
groups=('neovim-plugins')
install=nvim-doc.install
makedepends=('git')
_commit=2a4beefc7dfff8419f40f2672cfaaa726bdbff72
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/SirVer/ultisnips/archive/${pkgver}.tar.gz"
        git+https://github.com/honza/vim-snippets.git#commit=$_commit)
sha256sums=('550365cdf6bf030b9e5b77e511b4e6b1427660ea6a117c4b6bb77afcb950c4ce'
            'SKIP')

package() {
  cd "${pkgname#neovim-}-$pkgver"

  install -dm755 "$pkgdir/usr/share/nvim/runtime/"
  cp -r -t "$pkgdir/usr/share/nvim/runtime/" pythonx after doc ftdetect autoload\
      ftplugin plugin syntax 

  cd "${srcdir}/vim-snippets"

  install -dm755 "$pkgdir/usr/share/nvim/runtime/"
  cp -r -t "$pkgdir/usr/share/nvim/runtime/" UltiSnips autoload snippets

  # compile .pyc and .pyo files (fixes FS#43121)
  find "${pkgdir}" -name '*.py' -exec python -mpy_compile {} +
  find "${pkgdir}" -name '*.py' -exec python -O -mpy_compile {} +
}
# vim: sw=2 ts=2 et:
