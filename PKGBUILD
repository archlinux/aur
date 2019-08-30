# Maintainer: copygirl <copygirl@mcft.net>
pkgname=mindustry-git
pkgver=r4398.233ae99d3
pkgrel=1
pkgdesc="A sandbox tower defense game written in Java"
arch=("any")
url="https://github.com/Anuken/Mindustry"
license=("MIT")
depends=("java-runtime>=8")
makedepends=("git" "java-environment>=8")
source=("$pkgname::git://github.com/Anuken/Mindustry.git"
        "mindustry-git.desktop"
        "mindustry-git.png"
        "mindustry-git.sh")
md5sums=("SKIP"
         "9d28943fc8daa46d3552bce3cffaba57"
         "08674801f873e782f96029c0f655f0b3"
         "f1d39bc76c71e641cd84739a77c08ab9")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./gradlew desktop:dist
}

package() {
	install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
	install -Dm644 "$pkgname".png "$pkgdir"/usr/share/pixmaps/"$pkgname".png
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm755 "$pkgname"/desktop/build/libs/Mindustry.jar "$pkgdir"/usr/share/java/"$pkgname"/Mindustry.jar
}
