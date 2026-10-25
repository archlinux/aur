# Maintainer: Glax its@glax.dev
pkgname=eyetrackvr-bin
pkgver=b0.3.0_10
pkgrel=1
pkgdesc="Free and Affordable, Virtual Reality Eye Tracking Platform."
arch=('x86_64')
url="https://github.com/EyeTrackVR/EyeTrackVR"
license=('LicenseRef-Babble Software Distribution License 1.0')
depends=('eigen' 'python')
_releaseStr="0.3.0-BETA-10"
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/EyeTrackApp-${_releaseStr}/EyeTrackVR-${_releaseStr}-linux-x86_64.tar.gz"
"EyeTrackVR.desktop")
sha256sums=("ad512aad84049b36c2dd9d4924788da2c76028b2147c750206ffa2cf987c151c"
"0d7be87d7e53b71b04680c733dfe05b712a18c13a94d724b8eeeeaa1e86b8aa5")
provides=("eyetrackvr" "etvr")
conflicts=("eyetrackvr")

package() {
	INSTALLDIR="${pkgdir}/opt/eyetrackvr"
	EXTRACTED="EyeTrackVR-${_releaseStr}"

	# Copy files
	install -D "${srcdir}/${EXTRACTED}/eyetrackvr" "${INSTALLDIR}/eyetrackvr"
	cp -r "${srcdir}/${EXTRACTED}/_internal" "${INSTALLDIR}"

	# Add .desktop entry
	install -D "${srcdir}/EyeTrackVR.desktop" "${pkgdir}/usr/share/applications/EyeTrackVR.desktop"

	# Update .desktop entry
	# command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database || true

	# Create logs dir
	install -dm777 "${INSTALLDIR}/logs"
}
