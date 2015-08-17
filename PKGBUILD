## Contributor: Martin Wimpress <code@flexion.org>
## Contributor: Maxime Gauduin <alucryd@gmail.com>
## Contributor: Diego <cdprincipe@gmail.com>
## Contributor: dRaiser <pw@draiser.net>
pkgname=numix-themes-darkblue
pkgver=2.5
pkgrel=1
pkgdesc="A flat and light theme with a modern look using Arch Linux colors (GNOME, Cinnamon, MATE, Openbox, Unity, XFCE)"
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
sha256sums=('0fbdfc0281f959bb26e4dcd268bc665c00eeb0030ea4abe9acc8b02460cd1e07')

prepare() {
	cd Numix-${pkgver}
	## Replace the Numix Pink/Red with Arch Linux Blue,
	##  - https://www.archlinux.org/art/
	for i in gtk-2.0/gtkrc \
		gtk-3.0/gtk-dark.css \
		gtk-3.0/gtk-widgets-assets.css \
		gtk-3.0/gtk-widgets.css \
		gtk-3.0/gtk.css \
		gtk-3.0/settings.ini \
		gtk-3.0/apps/gnome-applications.css \
		gtk-3.0/apps/granite-widgets.css \
		gtk-3.0/apps/lightdm-gtk-greeter.css \
		gtk-3.0/apps/nemo.css \
		gtk-3.0/apps/synaptic.css \
		gtk-3.0/apps/unity.css \
		gtk-3.0/apps/xfce.css \
		metacity-1/metacity-theme-2.xml \
		metacity-1/metacity-theme-3.xml \
		openbox-3/themerc \
		xfce-notify-4.0/gtkrc \
		xfwm4/themerc \
		index.theme \
		gtk-3.0/assets/checkbox-checked-dark.svg \
		gtk-3.0/assets/menuitem-checkbox-checked.svg \
		gtk-3.0/assets/checkbox-mixed-dark.svg \
		gtk-3.0/assets/menuitem-checkbox-mixed.svg \
		gtk-3.0/assets/menuitem-radio-checked.svg \
		gtk-3.0/assets/radio-selected-dark.svg \
		gtk-3.0/assets/grid-selection-checked-dark.svg \
		gtk-3.0/assets/radio-mixed-dark.svg 
	do
		sed -i 's/#fc6f5d/#1568A4/g' "${i}"
		sed -i 's/#d64937/#1568A4/g' "${i}"
		sed -i 's/#b14638/#1568A4/g' "${i}"
		sed -i 's/Numix/Numix-DarkBlue/' "${i}"
	done
	sed -i 's|text_color:#333333|text_color:#dcdcdc|g
		s|base_color:#f9f9f9|base_color:#333333|g
		s|bg_color:#dedede|bg_color:#333333|g
		s|fg_color:#555555|fg_color:#dcdcdc|g
		s|toolbar_bg_color:#dedede|toolbar_bg_color:#404040|g
		s|toolbar_fg_color:#555555|toolbar_fg_color:#dcdcdc|g' gtk-2.0/gtkrc
	ln -srf gtk-3.0/gtk{-dark,}.css
}

package() {
	cd Numix-${pkgver}
	install -dm 755 "${pkgdir}"/usr/share/themes/Numix-DarkBlue
	rm -rf .git .gitignore CREDITS LICENSE README.md
	cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Numix-DarkBlue
}
