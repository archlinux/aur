# Maintainer: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman
pkgver=0.5.1
pkgrel=2
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python python-beautifulsoup4 python-html5lib)
optdepends=("vim: For using vim as a pager")


source=("https://files.pythonhosted.org/packages/e4/a0/6c8af0f95dc7fe418f2cf812a8704780f83295235c7f32b12e87e77a79e4/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a34261da3186d4f13836fec72e32258b82b6fad7d25f353d54ca54e831dd8589')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}/ --optimize=1

  mkdir -p ${pkgdir}/usr/share/zsh/site-functions
  mv ${pkgdir}/usr/share/zsh-completion/completions/cppman.zsh ${pkgdir}/usr/share/zsh/site-functions/_cppman
  rmdir ${pkgdir}/usr/share/zsh-completion/completions ${pkgdir}/usr/share/zsh-completion/

  chmod 644 ${pkgdir}/usr/share/zsh/site-functions/_cppman \
    ${pkgdir}/usr/share/bash-completion/completions/cppman.bash \
    ${pkgdir}/usr/share/man/man1/cppman.1 \
    ${pkgdir}/usr/share/doc/cppman/*

}
