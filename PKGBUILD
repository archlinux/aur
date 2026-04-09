# Maintainer: yum13241 <coolcrew45 at disroot dot org>

pkgname=elyprismlauncher-bin
pkgver=11.0.0_pre3
pkgrel=1
pkgdesc="Prism Launcher fork with integrated support for Ely.by accounts (binary version)"
arch=('x86_64')
url="https://github.com/ElyPrismLauncher/Launcher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(glibc mesa-utils gcc-libs java-runtime=17 libarchive libgl pciutils qrencode qt6-base qt6-imageformats qt6-networkauth qt6-svg zlib hicolor-icon-theme tomlplusplus cmark)
provides=('elyprismlauncher')
conflicts=('elyprismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/ElyPrismLauncher/Launcher/releases/download/${pkgver}/PineconeMC-Linux-Qt6-Portable-${pkgver}.tar.gz")
noextract=("PineconeMC-Linux-Qt6-Portable-${pkgver}.tar.gz")
sha256sums=('SKIP')

package()
{
	install -d "${pkgdir}/usr"
	tar -C "${pkgdir}/usr" -xvf PineconeMC-Linux-Qt6-Portable-${pkgver}.tar.gz
	
	# We must now remove the bundled libraries and the portable flag.
	rm -rf "${pkgdir}"/usr/manifest.txt
	rm -rf "${pkgdir}"/usr/portable.txt
	rm -rf "${pkgdir}"/usr/bin/xdg-open
	rm -rf "${pkgdir}"/usr/lib
	rm -rf "${pkgdir}"/usr/share/X11
	rm -rf "${pkgdir}"/usr/share/glib-2.0
	rm -rf "${pkgdir}"/usr/share/libthai
	# NOTE: Qt6 is still statically linked unfortunately.
	
	chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
