# Maintainer: AlaEldin Mohamed <aeiedamo@gmail.com>

pkgname=abdownloadmanager
pkgver=1.11.1
pkgrel=1
pkgdesc="A Download Manager that speeds up your downloads."
arch=("x86_64" "aarch64")
url="https://abdownloadmanager.com/"
license=('Apache-2.0')
depends=( 'curl' 'hicolor-icon-theme' 'java-runtime' 'libarchive' 'ttf-font' )
options=(!strip)

source=( 'com.abdownloadmanager.desktop' )

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz"::"https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz"::"https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_arm64.tar.gz")

sha256sums=('030ab06d48dfa1a8cf42f4c7ce09e8541d5bb5c91fc808392640f28d005d48e3')
sha256sums_x86_64=('c95dc4c05af00934ba3a87e82ccddb6ec95b7bbad049d210da6509f3ada65f49')
sha256sums_aarch64=('f23596ff1743a31fc70e0a203e98cfe9a36f35e962886612a9ad6a380fc73e89')

noextract=("${pkgname}-${pkgver}-x86_64.tar.gz" "${pkgname}-${pkgver}-aarch64.tar.gz")

prepare() {
	mkdir -p abdownloadmanager
	bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.tar.gz" --strip-components=1 -C abdownloadmanager
}

package() {
	install -dm0755 "${pkgdir}/opt/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"

	cp -a "abdownloadmanager" "${pkgdir}/opt/${pkgname}"

	ln -f -s "${pkgdir}/opt/${pkgname}/bin/ABDownloadManager" "${pkgdir}/usr/bin/"
	ln -f -s "${pkgdir}/opt/${pkgname}/lib/ABDownloadManager.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
	install -Dm0644 "com.abdownloadmanager.desktop" "${pkgdir}/usr/share/applications/com.abdownloadmanager.desktop"
}
