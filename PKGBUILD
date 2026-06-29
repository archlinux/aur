# Maintainer:  Joost Bremmer <contact at madeofmagicandwires.online>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=neovim-ultisnips
pkgver=4.0
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
sha256sums=('55af0b5e8b33e85322456a102d80da7103ff85308587bea052d2410d64155c85'
            '664d560ab5839005756692fb9a1541c226195a68ed7b63ca0e2c0a920eb9b870')

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
