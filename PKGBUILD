# Maintainer: Alexandre Bouvier <contact@amb.tf>
_reponame=Mega_Bezel
_pkgname=libretro-mega-bezel
pkgname=$_pkgname-git
pkgver=r192.45223b6
pkgrel=1
pkgdesc="Reflection shader for RetroArch"
arch=('any')
url="https://forums.libretro.com/t/hsm-mega-bezel-reflection-shader-feedback-and-updates"
license=('LGPL3')
groups=('libretro')
depends=('libretro-shaders-slang')
makedepends=('git')
optdepends=('retroarch>=1.9.8')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_reponame::git+https://github.com/HyperspaceMadness/Mega_Bezel.git")
b2sums=('SKIP')

pkgver() {
	cd $_reponame
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/share/libretro/shaders/shaders_slang/bezel
	rm -r $_reponame/{.git,MegaBezelLogo.png,tools,WIP}
	cp -dr --no-preserve=ownership $_reponame "$pkgdir"/usr/share/libretro/shaders/shaders_slang/bezel
}
