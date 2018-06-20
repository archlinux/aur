# Contributor: Fabio ‘Lolix’ Loli <lolix at disroot dot org>
# Contributor: Daniel Miranda <dmiranda at gmail dot com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Maintainer: Gustavo Costa <gusbemacbe@gmail.com>

pkgname=suru-plus-pack-git
pkgver=r1.6
pkgrel=1
pkgdesc="A full collection of three Suru++ icons themes, based on Sam Hewitt's Suru Icons"
arch=('any')
license=('GPL3')
makedepends=('git')
options=('!strip')
provides=(suru-plus-pack )
conflicts=(suru-plus-pack suru-plus suru-plus-dark suru-plus-telinkrin)
source=("git+https://github.com/gusbemacbe/suru-plus"
        "git+https://github.com/gusbemacbe/suru-plus-dark"
        "git+https://github.com/gusbemacbe/suru-plus-telinkrin")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() 
{
  cd suru-plus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() 
{
  install -d "${pkgdir}"/usr/share/icons
  cp -r "${srcdir}"/suru-plu{s,s-dark,s-telinkrin} "${pkgdir}"/usr/share/icons/

  find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
  find "${pkgdir}"/usr -type d -exec chmod 755 {} \;

  rm -r "$pkgdir"/usr/share/icons/suru-plu{s,s-dark,s-telinkrin}/{.git,.github}
  rm -f "$pkgdir"/usr/share/icons/suru-plu{s,s-dark,s-telinkrin}/{.gitattributes,.gitignore,*.md,*.jpg,*.svg,*.png, 'Suru++ OpenDesktop'}
}