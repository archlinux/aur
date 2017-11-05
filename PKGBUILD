# Maintainer: Fabio Loli <loli_fabio@protonmail.com>

pkgname=ptxconf-git
pkgver=r35.70d2e20
pkgrel=2
pkgdesc="Pen tablet and Touch screen Xinput Configuration tool (PTXConf). Configures touch/pen devices to work with extended desktops and multiple screens on Linux"
arch=('i686' 'x86_64')
url="https://github.com/wenhsinjen/ptxconf"
license=('AGPL3')
depends=('xorg-xinput' 'python2-libappindicator' 'python2' 'pygtk')
makedepends=('git')
provides=('ptxconf')
conflicts=('ptxconf')
source=("${pkgname}::git+https://github.com/wenhsinjen/ptxconf.git"
        'ptxconf.desktop')
md5sums=('SKIP'
         'ea437e99722a1ce37f0893ddac76afe4')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  mv ${pkgdir}/usr/bin/ptxconf.py ${pkgdir}/usr/bin/ptxconf
  install -D ${srcdir}/ptxconf.desktop ${pkgdir}/usr/share/applications/ptxconf.desktop
}
