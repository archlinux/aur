# Published to the AUR by KSXGitHub/github-actions-deploy-aur.
# The release tag is v${pkgver}+${pkgrel}. Its asset name matches
# packaging/linux/build-release.sh.
pkgname=gastube
pkgver=0.9.3
pkgrel=15
pkgdesc='Ad-free YouTube client'
arch=('x86_64')
url='https://github.com/alpha-liu-01/GasTube'
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv')
options=('!strip' '!debug')
_tag="v${pkgver}+${pkgrel}"
_archive="gastube-${pkgver}+${pkgrel}-linux-x64.tar.gz"
source=(
  "${_archive}::https://github.com/alpha-liu-01/GasTube/releases/download/${_tag}/${_archive}"
  "LICENSE::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/LICENSE"
  "gastube.desktop::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/gastube.desktop"
  "gastube-16.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/16x16/apps/gastube.png"
  "gastube-24.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/24x24/apps/gastube.png"
  "gastube-32.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/32x32/apps/gastube.png"
  "gastube-48.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/48x48/apps/gastube.png"
  "gastube-64.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/64x64/apps/gastube.png"
  "gastube-256.png::https://raw.githubusercontent.com/alpha-liu-01/GasTube/${_tag}/packaging/linux/icons/256x256/apps/gastube.png"
)
sha256sums=('9df346f4a56bef6c02d66d42cae0f23ee5c48ead38ca9bca0cb2dcf2d24835c3'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '47c08a805b2dad75906000d8a3c7da5c16c517e143db34ede8e5230be28d92e6'
            'a7d0b5b8baeed45f2e74e68ae7f14988e068bacc08f71e96fa7aae6a1356dd88'
            '38c5f9f08c5b6edd0bca83322db452752b5aa8b2b2cb3cc6b063ae9f6810d9a4'
            '13ace8d1466c2a7f8f0cbb6f30b9a0693bdad12f09171878a033ea6b9316a178'
            '2f479bcc40b949c09a3068eedeec50249ea948f8eaa28ee1197a7dd33d4ee80d'
            '11d91803e7159ff3004708646c49d673472bce013852cd615507b4de676963e6'
            'f72055ffb5273d6ba2fe94404ed2a06886812bdfaf0fbd6b3dffcda11993cf6a')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/gastube" "${pkgdir}/opt/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/gastube/gastube "${pkgdir}/usr/bin/gastube"
  install -Dm644 "${srcdir}/gastube.desktop" \
    "${pkgdir}/usr/share/applications/gastube.desktop"
  local size
  for size in 16 24 32 48 64 256; do
    install -Dm644 "${srcdir}/gastube-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/gastube.png"
  done
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
