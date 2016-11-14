# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=ldoc-git
_pkgname=ldoc
pkgver=1.4.6
pkgrel=1
pkgdesc='LuaDoc-compatible documentation generation system'
url='https://github.com/stevedonovan/ldoc'
arch=('any')
license=('custom')
depends=('lua' 'lua-penlight')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
provides=('ldoc')
conflicts=('ldoc')
md5sum=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/./g'
}

package() {
  cd ${_pkgname}

  # install library
  install -dm 755 "${pkgdir}/usr/share/lua/5.3"
  cp -a ldoc "${pkgdir}/usr/share/lua/5.3"

  # install binaries
  install -Dm 755 ldoc.lua "${pkgdir}/usr/bin/ldoc.lua"
  ln -s ldoc.lua "${pkgdir}/usr/bin/ldoc"

  # copy docs
  install -Dm 644 readme.md doc/doc.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
