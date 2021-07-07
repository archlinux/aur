# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Mohammad AlSaleh <CE.Mohammad.AlSaleh at gmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=lua-language-server
pkgver=2.0.3
pkgrel=1
license=('MIT')
pkgdesc='Lua Language Server coded by Lua'
url='https://github.com/sumneko/lua-language-server'
arch=('x86_64')
depends=('lua')
makedepends=('ninja' 'git')
source=(
  "${pkgname}::git+https://github.com/sumneko/lua-language-server.git#tag=${pkgver}"
  'wrapper'
)
cksums=('SKIP'
        '1766996792')
sha256sums=('SKIP'
            'd61e2b4544bb3a4ef052f7d1c6dbc14a3bfd45e0488d231cccdd553b7e22243b')
b2sums=('SKIP'
        'f89be7c8e62bb1eb5fe36964f79a28cc6590358a2b6270c1a22c0929444c275a62d3dd36f27b40612de7d1a5867bf6bf4f1547e878a37870d4fa81e8447ea82d')

prepare() {
  cd "lua-language-server"

  git submodule update --init --recursive
}

build() {
  cd "lua-language-server"

  ninja -C 3rd/luamake -f compile/ninja/linux.ninja
  ./3rd/luamake/luamake rebuild
}

package() {
  cd "lua-language-server"

  install -dm0755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin/Linux/* "${pkgdir}/usr/lib/${pkgname}"

  install -dm0755 "${pkgdir}/usr/share/${pkgname}"

  cp -a \
    main.lua platform.lua debugger.lua \
    locale script meta \
    "${pkgdir}/usr/share/${pkgname}"

  install -Dm0755 "${srcdir}/wrapper" "${pkgdir}/usr/bin/lua-language-server"
}
