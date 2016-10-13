# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=neovim-ultisnips
pkgver=3.1
pkgrel=1
pkgdesc='TextMate-style snippets for Neovim.'
arch=('any')
url='https://github.com/SirVer/ultisnips'
license=('GPL3')
depends=('neovim' 'python-neovim')
groups=('neovim-plugins')
install=nvim-doc.install
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/SirVer/ultisnips/archive/${pkgver}.tar.gz"
        git+https://github.com/honza/vim-snippets.git)
sha256sums=('32ea72d321f07755e878f640398c72f0a072e56a980a66bdc7bfb41ba85fa6e7'
            'SKIP')

package() {
  cd "${srcdir}/ultisnips-$pkgver"

  install -dm755 "$pkgdir/usr/share/nvim/runtime/"
  cp -r -t "$pkgdir/usr/share/nvim/runtime/" pythonx after doc ftdetect autoload\
      ftplugin plugin syntax utils

  cd "${srcdir}/vim-snippets"

  install -dm755 "$pkgdir/usr/share/nvim/runtime/"
  cp -r -t "$pkgdir/usr/share/nvim/runtime/" UltiSnips autoload snippets

  # compile .pyc and .pyo files (fixes FS#43121)
  find "${pkgdir}" -name '*.py' -exec python2 -mpy_compile {} +
  find "${pkgdir}" -name '*.py' -exec python2 -O -mpy_compile {} +
}
# vim: sw=2 ts=2 et:
