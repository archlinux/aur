# Maintainer: yum13241 <coolcrew45 at disroot dot org>

PKGEXT=.pkg.tar
pkgname=elyprismlauncher-bin
pkgver=9.5 # upstream doesn't use a trailing .0 for releases.
pkgrel=1
pkgdesc="Prism Launcher fork with integrated support for Ely.by accounts (binary version)"
arch=('x86_64')
url="https://github.com/ElyPrismLauncher/ElyPrismLauncher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'quazip-qt6' 'zlib' 'hicolor-icon-theme' 'tomlplusplus' 'cmark')
provides=('elyprismlauncher')
conflicts=('elyprismlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/ElyPrismLauncher/ElyPrismLauncher/releases/download/${pkgver}/ElyPrismLauncher-ArchLinux-x86_64-${pkgver}.pkg.tar.zst")
noextract=("ElyPrismLauncher-ArchLinux-x86_64-${pkgver}.pkg.tar.zst")
sha256sums=('SKIP')

pkgver()
{
	printf $(git ls-remote --tags https://github.com/ElyPrismLauncher/ElyPrismLauncher.git | sed 's/.*[/:]//' | tail -n 1) && printf "\n" 
}

package()
{
	mkdir ${pkgdir}/usr
	cd ${pkgdir}/usr
	tar -xvf ${srcdir}/ElyPrismLauncher-ArchLinux-x86_64-${pkgver}.pkg.tar.zst --strip-components=1
	mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
		"${pkgdir}/usr/share/mime/packages/elyprismlauncher-modrinth-mrpack-mime.xml"
}
