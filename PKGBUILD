# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.2.74
pkgrel=1
pkgdesc="Minimal GPUI-powered terminal (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/lassejlv/termy"
license=('MIT')
depends=('bash' 'glibc' 'gcc-libs' 'glib2'
         'freetype2' 'fontconfig' 'libxcb' 'wayland' 'libxkbcommon'
         'libxkbcommon-x11' 'vulkan-icd-loader')
provides=('termy')
conflicts=('termy')
source=("termy.desktop"
        "LICENSE::https://raw.githubusercontent.com/lassejlv/termy/v${pkgver}/LICENSE"
        "termy_icon.png::https://raw.githubusercontent.com/lassejlv/termy/v${pkgver}/assets/termy_icon.png")
b2sums=('ce3f66620d3a7da5bd6e017d3432e2f509c095aa32ee8b7ea4ccf24d879f201bf29e62b59708bf32a01338ceedb4bbe9152ee7209564cd0191e5a9c58f8389e2'
        '0128ba93a8dc10df25286bd85db9df93ef7ad68abd077d895ba29c2b1af7eca9530dc7146f0941ff128738416e2319ed3f906ac3525f26eff2589be9369149eb'
        '846adc793544028ef1bb111802a2e61013f6a0623f86d8546e27210ded24b1ef367e73ea4cda56a15f40c85a893d2f5c8288bbde035c9d77aa53d2fd223ead90')
source_x86_64=("termy-${pkgver}-${CARCH}.tar.gz::https://github.com/lassejlv/termy/releases/download/v${pkgver}/Termy-v${pkgver}-linux-${CARCH}.tar.gz")
b2sums_x86_64=('785e6bd5e3285113636e6ce864e163beccc3a05059ab0c2bbda821d5c64361ace5e4468237848a9608c8d491110e9c84419bc5b064cb86b6025425a357a868f4')

package() {
  cd "$srcdir/termy"

  # The launcher execs the sibling termy-bin binary, and the CLI integration
  # expects termy-cli to be installed alongside it.
  install -Dm755 "termy" "$pkgdir/usr/bin/termy"
  install -Dm755 "termy-bin" "$pkgdir/usr/bin/termy-bin"
  install -Dm755 "termy-cli" "$pkgdir/usr/bin/termy-cli"

  # Install desktop file, icon, and file-manager context actions
  install -Dm644 "$srcdir/termy.desktop" "$pkgdir/usr/share/applications/termy.desktop"
  install -Dm644 "$srcdir/termy_icon.png" "$pkgdir/usr/share/pixmaps/termy.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/termy/file-manager/termy-open-tab.desktop" \
    "$pkgdir/usr/share/kio/servicemenus/termy-open-tab.desktop"
  install -Dm644 "$srcdir/termy/file-manager/termy-open-tab.desktop" \
    "$pkgdir/usr/share/kservices5/ServiceMenus/termy-open-tab.desktop"
  install -Dm644 "$srcdir/termy/file-manager/termy-open-tab.nemo_action" \
    "$pkgdir/usr/share/nemo/actions/termy-open-tab.nemo_action"
  install -Dm755 "$srcdir/termy/file-manager/nautilus-open-tab.sh" \
    "$pkgdir/usr/share/nautilus/scripts/Open new Termy tab here"
  install -Dm755 "$srcdir/termy/file-manager/nautilus-open-tab.sh" \
    "$pkgdir/usr/share/caja/scripts/Open new Termy tab here"
}
