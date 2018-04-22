# Maintainer: Emerson Almeida <duke.m16@gmail.com>
# Contributor: Emerson Almeida <duke.m16@gmail.com>

pkgname=zoho-mail-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="A desktop version of your favorite mailsuite!"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2018, Zoho Corporation Pvt. Ltd."')
url="https://www.zoho.com/mail"
options=('!strip' '!upx')

source=('zoho-mail-desktop' 'LICENSE')

sha256sums=('e506b8a17f4b88243dfca6d76c9d1df408dad597eb52f233fb5290ff2c3d4bf9'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
sha256sums_x86_64=('981bf5cfe72519a210793b4ac02d4beee40bfe651ac873c95b375a8429a37c88')
sha256sums_i686=('8f7c4477099b5bda4ecb74d78591c0a432d5311bd8dc5e379798812f7c1bb1c6')

source_x86_64=("https://www.zoho.com/mail/desktop/linux/installer-x64-${pkgver}.deb")
source_i686=("https://www.zoho.com/mail/desktop/linux/installer-x86-${pkgver}.deb")

provides=(
    'libnode'
    'libffmpeg'
)

depends=(
    'nss'
    'libxtst'
    'alsa-lib'
    'libxss'
    'gtk2'
    'gconf'
)

package() {
	cd "${srcdir}"

	tar -xf data.tar.xz -C "${pkgdir}"

  for size in 22 24 32 48 64 128 256 512; do
    install -D "${pkgdir}/usr/share/pixmaps/zoho-mail-desktop.png" \
                 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
  done

	chmod -R go-w "${pkgdir}"/usr

  # Bin Script
  rm "${pkgdir}"/usr/bin/zoho-mail-desktop
  install -Dm755 "${srcdir}/zoho-mail-desktop" "${pkgdir}/usr/bin/zoho-mail-desktop"

  # License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
