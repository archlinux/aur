# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker
pkgname=${_pkgname}-bin
pkgver=2.6.4
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc='wayland application runner'

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'gtk4' 'gtk4-layer-shell' 'poppler-glib' 'cairo' 'elephant')
optdepends=('elephant-providerlist: providerlist provider'
            'elephant-desktopapplications: desktopapplications provider'
            'elephant-archlinuxpkgs: archlinuxpkgs provider'
            'elephant-calc: calc provider'
            'elephant-clipboard: clipboard provider'
            'elephant-files: files provider'
            'elephant-menus: menus provider'
            'elephant-runner: runner provider'
            'elephant-symbols: symbols provider'
            'elephant-todo: todo provider'
            'elephant-unicode: unicode provider'
            'elephant-websearch: websearch provider'
            'elephant-bluetooth: bluetooth provider'
            'elephant-windows: windows provider'
            'elephant-snippets: snippets provider'
            'elephant-nirisessions: nirisessions provider')

backup=("etc/xdg/${_pkgname}/config.toml")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "config-${pkgver}.toml::${_urlraw}/resources/config.toml"
        "item-${pkgver}.xml::${_urlraw}/resources/themes/default/item.xml"
        "item_archlinuxpkgs-${pkgver}.xml::${_urlraw}/resources/themes/default/item_archlinuxpkgs.xml"
        "item_calc-${pkgver}.xml::${_urlraw}/resources/themes/default/item_calc.xml"
        "item_clipboard-${pkgver}.xml::${_urlraw}/resources/themes/default/item_clipboard.xml"
        "item_dmenu-${pkgver}.xml::${_urlraw}/resources/themes/default/item_dmenu.xml"
        "item_files-${pkgver}.xml::${_urlraw}/resources/themes/default/item_files.xml"
        "item_providerlist-${pkgver}.xml::${_urlraw}/resources/themes/default/item_providerlist.xml"
        "item_symbols-${pkgver}.xml::${_urlraw}/resources/themes/default/item_symbols.xml"
        "item_todo-${pkgver}.xml::${_urlraw}/resources/themes/default/item_todo.xml"
        "item_unicode-${pkgver}.xml::${_urlraw}/resources/themes/default/item_unicode.xml"
        "keybind-${pkgver}.xml::${_urlraw}/resources/themes/default/keybind.xml"
        "layout-${pkgver}.xml::${_urlraw}/resources/themes/default/layout.xml"
        "preview-${pkgver}.xml::${_urlraw}/resources/themes/default/preview.xml"
        "style-${pkgver}.css::${_urlraw}/resources/themes/default/style.css")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '6da90528fad39c1158ef7240ea70dbef03c0bd0ba3be2d665215e938d0dec3c6'
            'd31a1cc74f5485bb2c72a2afe2a47fc411d9433ebeb1ee3b74ed1b72033a233c'
            'd6dac24c66c6e851e4a0f702154ccd92a1b0f64990beeff393b530ccd1089721'
            'e9613245a50e92f6da1e6f09bc84473fae716ee4c30b2536a4f0b285a1536c94'
            '1c08b011b1c28ca332c96888e4b8fc02f36ec1e057986acfca568dfa4cccf73f'
            '2c4d13df69d24ce6c7b4ff8863ee1b443fefea6c941bb4b4b8393e6e5de4013f'
            '4fe8af0457cdf1631ff3b6ac4ead13111e9044ab8071bcfe4dcbf48d0af0ff98'
            'd263ce6a3335d42560e7ddbffcdc1186744bcc7ae04cd6282bb188dd7d6f5c9a'
            '4de69a8744729c5a6521d062b541831046c6f06887ac30e22465c1f753764c00'
            '34ef99fced5e26a34a834e3edb2e4162823cafea1002f7c753522a05d59ef1fd'
            '8e812699db2aa167663ccfdaf865e88a833623593f252fab97d820f7d0d7e718'
            '34ef99fced5e26a34a834e3edb2e4162823cafea1002f7c753522a05d59ef1fd'
            '8113e9f81aaa28bba9c4526c9bbbeb940600d842d9d5cec144fcc86e975184a9'
            '5175c88a9bb7db96ea7286eb0226afd89caa2f2aa178a64a00fc2348016db0e3'
            '073a912e3eee95249236af90ce50496a3b94bd840919b2d94e058054dbf3ca25'
            '229596513d82ef486c637c7989e7bd589c1a3f53fcd9d348ae708464a55c5b88')
sha256sums_x86_64=('0748e8c3151954aa392d2d8a40432c476beef012802d09bd2c63840bddefb828')

prepare() {
    cd "${srcdir}" || exit 1

    mkdir -p ./config
    for f in *.toml; do mv ${f} config/${f//-${pkgver}/} ; done

    mkdir -p ./themes
    for f in *.{xml,css}; do mv ${f} themes/${f//-${pkgver}/} ; done
}

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}/config" || exit 1
    install -Dm644 config.toml -t "${pkgdir}/etc/xdg/${_pkgname}"

    cd "${srcdir}/themes" || exit 1
    for theme in ./*; do
        install -Dm644 ${theme} -t "${pkgdir}/etc/xdg/${_pkgname}/themes/default"
    done
}
