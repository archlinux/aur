# Maintainer: j-james <jj@j-james.me>

pkgname=arc-gtk-theme-colorpack
_pkgname=arc-theme
pkgver=20200819
pkgrel=1
pkgdesc="Build of arc-theme for a variety of Material Design colors."
arch=('any')
# Upstream url: https://github.com/horst3180/arc-theme
# Now using soft fork: https://github.com/jnsh/arc-theme/issues/18
url="https://github.com/j-james/arc-theme-colorpack"
license=('GPL3')
makedepends=('sassc' 'optipng' 'inkscape')
conflicts=('arc-gtk-theme')
provides=('arc-gtk-theme')
source=("https://github.com/jnsh/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('bedff15a195c21934a813ca600b88ced81c3db66b7c25ab75b7193998a89338a7888711abb213877210a62d2460300bc32d40402bdd1f6c4d8fa903999eb1b0e')

prepare() {
	cp -a ${_pkgname}-${pkgver}{,-Amber}
	cp -a ${_pkgname}-${pkgver}{,-Blue}
	cp -a ${_pkgname}-${pkgver}{,-BlueGrey}
	cp -a ${_pkgname}-${pkgver}{,-Brown}
	cp -a ${_pkgname}-${pkgver}{,-Cyan}
	cp -a ${_pkgname}-${pkgver}{,-DeepOrange}
	cp -a ${_pkgname}-${pkgver}{,-DeepPurple}
	cp -a ${_pkgname}-${pkgver}{,-Green}
	cp -a ${_pkgname}-${pkgver}{,-Grey}
	cp -a ${_pkgname}-${pkgver}{,-Indigo}
	cp -a ${_pkgname}-${pkgver}{,-LightBlue}
	cp -a ${_pkgname}-${pkgver}{,-LightGreen}
	cp -a ${_pkgname}-${pkgver}{,-Lime}
	cp -a ${_pkgname}-${pkgver}{,-Orange}
	cp -a ${_pkgname}-${pkgver}{,-Pink}
	cp -a ${_pkgname}-${pkgver}{,-Purple}
	cp -a ${_pkgname}-${pkgver}{,-Red}
	cp -a ${_pkgname}-${pkgver}{,-Teal}
}

# @param: theme_name, selected_bg_color, suggested_color
colorize() {
	cd ${_pkgname}-${pkgver}-$1

	find . -type f -name "configure.ac" -exec sed -i \
	"s/themes\/Arc\]/themes\/Arc-$1\]/Ig;\
	 s/themes\/Arc-Darker\]/themes\/Arc-Darker-$1\]/Ig;\
	 s/themes\/Arc-Dark\]/themes\/Arc-Dark-$1\]/Ig;\
	 s/themes\/Arc-Lighter\]/themes\/Arc-Lighter-$1\]/Ig;\
	" {} \;

	find . -type f -name "*.*" -exec sed -i \
	"s/#5294e2/$2/Ig;\
	 s/#4DADD4/$3/Ig" {} \;
	find . -type f -name "gtkrc" -exec sed -i \
	"s/#5294e2/$2/Ig;\
	 s/#4DADD4/$3/Ig" {} \;

	./autogen.sh --prefix=/usr --with-gnome-shell=3.36 --with-cinnamon=4.6 --with-gtk3=3.24

	cd ..
}

build() {
	colorize "Amber" "#FFC107" "#FFD54F"
	colorize "Blue" "#2196F3" "#64B5F6"
	colorize "BlueGrey" "#607D8B" "#90A4AE"
	colorize "Brown" "#795548" "#A1887F"
	colorize "Cyan" "#00BCD4" "#4DD0E1"
	colorize "DeepOrange" "#FF7043" "#FF8A65"
	colorize "DeepPurple" "#673AB7" "#9575CD"
	colorize "Green" "#4CAF50" "#81C784"
	colorize "Grey" "#9E9E9E" "#E0E0E0"
	colorize "Indigo" "#3F51B5" "#7986CB"
	colorize "LightBlue" "#03A9F4" "#4FC3F7"
	colorize "LightGreen" "#8BC34A" "#AED581"
	colorize "Lime" "#AFB42B" "#CDDC39"
	colorize "Orange" "#FF9800" "#FFB74D"
	colorize "Pink" "#E91E63" "#F06292"
	colorize "Purple" "#9C27B0" "#BA68C8"
	colorize "Red" "#F44336" "#E57373"
	colorize "Teal" "#009688" "#16a085"
	#4DB6AC

	cd ${_pkgname}-${pkgver}
	./autogen.sh --prefix=/usr --with-gnome-shell=3.36 --with-cinnamon=4.6 --with-gtk3=3.24
}

package() {
	cd ${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Amber
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Blue
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-BlueGrey
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Brown
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Cyan
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-DeepOrange
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-DeepPurple
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Green
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Grey
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Indigo
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-LightBlue
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-LightGreen
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Lime
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Orange
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Pink
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Purple
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Red
	make DESTDIR="${pkgdir}" install
	cd ../${_pkgname}-${pkgver}-Teal
	make DESTDIR="${pkgdir}" install
}
