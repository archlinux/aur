# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_wallnames=(AnimeRoom
            Aura
						Carvan
						CatherineRoom
						Coast
						CorporationHall
						CorporationStreet
						DesertPeak
						DesertSands
						DesertTree
						DesertValley
						Dome
						DynamicFry
						ExternalHimitsuHouse
						Firewatch
            Firewatch2
            FocalFossa
            Fuji
            Globe
            GroovyGorilla
            HimitsuHouse
            HirsuitHippo
            HirsuitHippoBlue
            KagomeRoom
            Lakeside
            LakesideDeer
            LakeTheCliff
            LofiALex
            LofiDino
            LofiGirl
            MaterialMountains
            MinimalMojave
            Mojave
            Monterey
            PlasticBeach
            Riverside
            Rock
            Rocknegy
            Rockscketto
            StevenUniverse
            TheBeach
            TheDesert
            TheLake
            TokyoStreet
            Viragegy
            Viragharom
            Viragnegy
            Win11Lake
            Windows111
            Windows112
            Windows113
            Wiravketto
            LofiCity
            Hills
            ChromeOSEarth
            DeadTree)
pkgbase=gnome-dynamic-wallpaper
pkgname=()

for _n in "${_wallnames[@],,}"
do
	pkgname+=("$pkgbase-$_n")
done

pkgver=r1.15abbd0
pkgrel=1
pkgdesc='Light and Dark Wallpapers for Gnome 42'
arch=(any)
_reponame=Light-and-Dark-Wallpapers-for-Gnome-42
url="https://github.com/amrosolaiman/$_reponame"
license=(unknown)
depends=(gnome-desktop)
source=("$url/archive/refs/heads/main.tar.gz")
md5sums=(SKIP)

pkgver() {
	cd "$_reponame-main"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_walldir="/usr/share/backgrounds/Wallpapers"

_package() {
	cd "$_reponame-main"
	install -d "$pkgdir$_walldir"
	cp -r "Wallpapers/$1" "$pkgdir$_walldir"
	install -Dm644 "xml/$1.xml" -t "$pkgdir/usr/share/gnome-background-properties"
}

for _p in ${_wallnames[@]}
do
	eval "package_$pkgbase-${_p,,}() {
		$(declare -f "_package")
		_package $_p
	}"
done
