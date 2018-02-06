# Maintainer: copygirl <copygirl@mcft.net>
pkgname=mindustry-git
pkgver=r674.55ae4c6
pkgrel=1
pkgdesc="A pixelated sandbox tower defense game"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("MIT")
depends=("java-runtime>=8")
makedepends=("git" "java-environment>=8" "gradle")
source=("$pkgname::git://github.com/Anuken/Mindustry.git"
        "mindustry-git.desktop"
        "mindustry-git.png"
        "mindustry-git.sh")
md5sums=("SKIP"
         "9d28943fc8daa46d3552bce3cffaba57"
         "08674801f873e782f96029c0f655f0b3"
         "bb183ee1b54f1fa25e31647e5aab053e")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	gradle desktop:dist
}

package() {
	install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
	install -Dm644 "$pkgname".png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm755 "$pkgname"/desktop/build/libs/desktop-release.jar "$pkgdir"/usr/share/java/"$pkgname"/desktop-release.jar
}
