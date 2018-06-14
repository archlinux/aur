# Maintainer: Stefano Capitani <stefano_at_manjaro_dot_org>
# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: ceyhunnabiyev for Breath color and Adapta Black variation <https://github.com/ceyhunnabiyev>

# Arch Maintainer: Przemyslaw Buczkowski <przemub_at_przemub_dot_pl>

pkgname=('adapta-maia-theme'
         'adapta-breath-theme'
         'adapta-black-maia-theme'
         'adapta-black-breath-theme'
         #'adapta-gtk-theme'
)
_pkgname=adapta-gtk-theme
_theme=manjaro-gnome-theme
pkgver=3.94.0.149
pkgrel=2
arch=(any)
url="https://github.com/adapta-project/${_pkgname}"
license=('GPL2' 'CCPL')
optdepends=('ttf-roboto: The recommended font'
            'noto-fonts: The recommended font for improved language support'
            'gtk-engine-murrine: for gtk2 themes'
            'kvantum-qt5: qt5 engine for adapta')
makedepends=('libxml2'
             'libsass'
             'sassc'
             'librsvg'
             'inkscape'
             'libcanberra'
             'parallel'
             'gnome-shell')
validpgpkeys=('2C675EC71CF31D4652AB608616A443152D7A865E')	     
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'Xfce-gtk3-Manjaro.patch')
sha256sums=('db69ef4e2de34d125b8a05fcd8881fc6d54fa7c4c194cadf69200760ed940cac'
            '43334dce4f801a6626c281b441f0e55b2dfdee25fdcc905837dbb6bc78197c72')
            
prepare() {  
	
	#custom two-colored whiskermenu for maia variants and Xfce Desktop icons view
    cd $_pkgname-$pkgver
    patch -p1 -i $srcdir/Xfce-gtk3-Manjaro.patch

    cd $srcdir
    #Create separate theme dirs
    for theme in adapta-maia-theme adapta-breath-theme adapta-black-maia-theme adapta-black-breath-theme; do
        cp -r $_pkgname-$pkgver $theme-$pkgver
    done
}

build_maia-theme() {

    cd "adapta-maia-theme-${pkgver}"
    msg "Apply Maia theme"

    find . -type f -name '*.*' -exec sed -i \
      "s/#00BCD4/#16a085/Ig" {} \;
    
    _adapta-var

    ./autogen.sh --prefix "${pkgdir}/usr" \
      --enable-plank \
      --enable-telegram \
      --enable-parallel
      #--enable-gtk_next --with-selection_color=#16A085 --with-second_selection_color=#16A085
    make
}

build_breath-theme() {

    #build
    cd "adapta-breath-theme-${pkgver}"
            msg "Apply Breath theme"

    find . -type f -name '*.*' -exec sed -i \
    "s/#00BCD4/#1abc9c/Ig;\
    s/#009688/#1abc9c/Ig;\
    s/#4DB6AC/#2fe2bf/Ig" {} \;
    
    _adapta-var
    
    ./autogen.sh --prefix "${pkgdir}/usr" \
      --enable-plank \
      --enable-telegram \
      --enable-parallel
      #--enable-gtk_next --with-selection_color=#1abc9c --with-second_selection_color=#2fe2bf --with-accent_color=#2fe2bf --with-suggestion_color=#1abc9c
    make
}

#build_adapta-gtk-theme() {
#  cd $_pkgname-$pkgver

#  ./autogen.sh \
#    --prefix='/usr' \
#    --enable-parallel \
#    --enable-plank \
#    --enable-telegram
#  make
#}

_adapta-var() {
#    ./gtk/asset/assets-clone/bar-blue.svg \
   find ./extra/gedit/adapta.xml \
    ./extra/plank/dock.theme \
    ./extra/telegram/dark/colors.tdesktop-theme \
    ./extra/telegram/light/colors.tdesktop-theme \
    ./gtk/asset/assets-gtk2.svg.in \
    ./gtk/asset/assets-gtk3.svg.in \
    ./gtk/asset/assets-clone/z-depth-1.svg \
    ./gtk/asset/assets-clone/z-depth-2.svg \
    ./gtk/gtk-2.0/colors.rc.in \
    ./gtk/gtk-2.0/colors-dark.rc.in \
    ./gtk/gtk-2.0/common.rc \
    ./gtk/gtk-2.0/common-eta.rc \
    ./gtk/sass/common/_colors.scss \
    ./m4/adapta-color-scheme.m4 \
    ./shell/asset/assets-cinnamon/ \
    ./shell/asset/assets-gnome-shell/ \
    ./shell/asset/assets-xfce/ \
    ./shell/sass/common/_colors.scss \
    ./shell/sass/gnome-shell/3.24/_extension-workspaces-to-dock.scss \
    ./shell/sass/gnome-shell/3.26/_extension-workspaces-to-dock.scss \
    ./shell/xfce-notify-4.0/gtkrc \
    ./wm/asset/assets-metacity/ \
    ./wm/asset/assets-openbox/ \
    ./wm/asset/assets-xfwm/ \
    ./wm/metacity-1/metacity-theme-2.xml \
    ./wm/openbox-3/themerc \
    ./wm/openbox-3/themerc-nokto \
    ./wm/xfwm4/themerc -type f -print | xargs sed -i -e \
    's/#2196F3/#38a8a3/Ig'  -e \
    's/#03A9f4/#299984/Ig'
}

_adapta-black() {
#    ./gtk/asset/assets-clone/bar-blue.svg \
   find ./extra/gedit/adapta.xml \
    ./extra/plank/dock.theme \
    ./extra/telegram/dark/colors.tdesktop-theme \
    ./extra/telegram/light/colors.tdesktop-theme \
    ./gtk/asset/assets-gtk2.svg.in \
    ./gtk/asset/assets-gtk3.svg.in \
    ./gtk/asset/assets-clone/z-depth-1.svg \
    ./gtk/asset/assets-clone/z-depth-2.svg \
    ./gtk/gtk-2.0/colors.rc.in \
    ./gtk/gtk-2.0/colors-dark.rc.in \
    ./gtk/gtk-2.0/common.rc \
    ./gtk/gtk-2.0/common-eta.rc \
    ./gtk/sass/common/_colors.scss \
    ./m4/adapta-color-scheme.m4 \
    ./shell/asset/assets-cinnamon/ \
    ./shell/asset/assets-gnome-shell/ \
    ./shell/asset/assets-xfce/ \
    ./shell/sass/common/_colors.scss \
    ./shell/sass/gnome-shell/3.24/_extension-workspaces-to-dock.scss \
    ./shell/sass/gnome-shell/3.26/_extension-workspaces-to-dock.scss \
    ./shell/xfce-notify-4.0/gtkrc \
    ./wm/asset/assets-metacity/ \
    ./wm/asset/assets-openbox/ \
    ./wm/asset/assets-xfwm/ \
    ./wm/metacity-1/metacity-theme-2.xml \
    ./wm/openbox-3/themerc \
    ./wm/openbox-3/themerc-nokto \
    ./wm/xfwm4/themerc -type f -print | xargs sed -i -e \
    's/#263238/#04251f/Ig'  -e \
    's/#CFD8DC/#d1fae6/Ig'  -e \
    's/#000016/#001600/Ig'  -e \
    's/#00bcd0/#19b89b/Ig'  -e \
    's/#001aff/#52917c/Ig'  -e \
    's/#03A9F4/#299984/Ig'  -e \
    's/#0B9BAF/#21977f/Ig'  -e \
    's/#13191C/#020e0c/Ig'  -e \
    's/#212B30/#031c17/Ig'  -e \
    's/#2196F3/#38a8a3/Ig'  -e \
    's/#222D32/#031b17/Ig'  -e \
    's/#243035/#04201a/Ig'  -e \
    's/#283237/#062823/Ig'  -e \
    's/#28343A/#052922/Ig'  -e \
    's/#29343a/#052923/Ig'  -e \
    's/#29353B/#062d27/Ig'  -e \
    's/#2A393E/#052e24/Ig'  -e \
    's/#2A4145/#053826/Ig'  -e \
    's/#2c383e/#06322a/Ig'  -e \
    's/#2d383f/#06322d/Ig'  -e \
    's/#2D4348/#063d2b/Ig'  -e \
    's/#2f3d44/#073b32/Ig'  -e \
    's/#2F5254/#054d2c/Ig'  -e \
    's/#315054/#31544d/Ig'  -e \
    's/#323D42/#093a31/Ig'  -e \
    's/#364146/#0a3e34/Ig'  -e \
    's/#364249/#0a433b/Ig'  -e \
    's/#374248/#0a423a/Ig'  -e \
    's/#37474F/#09493e/Ig'  -e \
    's/#384449/#0a4237/Ig'  -e \
    's/#39444a/#0b473e/Ig'  -e \
    's/#3B464B/#0b463b/Ig'  -e \
    's/#3f4d53/#0d5446/Ig'  -e \
    's/#404b51/#0d4f45/Ig'  -e \
    's/#414c51/#0e5346/Ig'  -e \
    's/#455A64/#0d6858/Ig'  -e \
    's/#4C575C/#126455/Ig'  -e \
    's/#4a555b/#115f54/Ig'  -e \
    's/#4d5a60/#126959/Ig'  -e \
    's/#4F5B60/#126857/Ig'  -e \
    's/#5099d0/#31b9b0/Ig'  -e \
    's/#5294c4/#3baba2/Ig'  -e \
    's/#546e7a/#118872/Ig'  -e \
    's/#555F64/#156f60/Ig'  -e \
    's/#55BCEA/#2ae5c2/Ig'  -e \
    's/#566067/#15746c/Ig'  -e \
    's/#56707d/#118d78/Ig'  -e \
    's/#5c9ece/#38bcb1/Ig'  -e \
    's/#608ab5/#489999/Ig'  -e \
    's/#65aadd/#3ad4ca/Ig'  -e \
    's/#677176/#1c8d7a/Ig'  -e \
    's/#6ec9cb/#47bd9a/Ig'  -e \
    's/#72b1df/#48d5ca/Ig'  -e \
    's/#779fd3/#52bfc7/Ig'  -e \
    's/#788286/#23a98c/Ig'  -e \
    's/#78909C/#1cc4a8/Ig'  -e \
    's/#85b4df/#5ed4d2/Ig'  -e \
    's/#90a4ae/#28e2c3/Ig'  -e \
    's/#979D9F/#32d29f/Ig'  -e \
    's/#B8C1C6/#a6f7ca/Ig'  -e \
    's/#B9C2C7/#a6f7ca/Ig'  -e \
    's/#BEC2C3/#a2fbc6/Ig'  -e \
    's/#C1C4C6/#acfbcc/Ig'  -e \
    's/#C5C9CB/#b1fbd4/Ig'  -e \
    's/#cbd8dc/#c7fadd/Ig'  -e \
    's/#cdd6da/#cdf9e3/Ig'  -e \
    's/#cddff0/#d0f1f0/Ig'  -e \
    's/#CFE9E8/#e0f1f0/Ig'  -e \
    's/#d4d6d7/#b6fcd6/Ig'  -e \
    's/#d4e9ee/#c7ffdb/Ig'  -e \
    's/#daddde/#d4fce6/Ig'  -e \
    's/#E1E3E4/#d3fde7/Ig'  -e \
    's/#e5e6e7/#d3fde0/Ig'  -e \
    's/#E5E9EC/#dafbe6/Ig'  -e \
    's/#E5F2F2/#dcfee3/Ig'  -e \
    's/#e6e7e8/#d3fde0/Ig'  -e \
    's/#E7E9EA/#d9fde9/Ig'  -e \
    's/#E9EAEC/#ddfde2/Ig'  -e \
    's/#e9ebeb/#ddfde4/Ig'  -e \
    's/#e9ebec/#ddfdec/Ig'  -e \
    's/#eaebec/#ddfde7/Ig'  -e \
    's/#eceff1/#e8fcf0/Ig'  -e \
    's/#F0F2F3/#ecfdf4/Ig'  -e \
    's/#f1f3f4/#ecfdf4/Ig'  -e \
    's/#f2f4f5/#ecfdf4/Ig'  -e \
    's/#F7F9F9/#f1fef4/Ig'  -e \
    's/#FAFBFC/#f5fef8/Ig'  -e \
    's/#fdfdfe/#fbfffa/Ig'  -e \
    's/#eeefef/#e7feeb/Ig'  -e \
    's/rgba(19, 25, 28,/rgba(2, 14, 12,/Ig'  -e \
    's/19;;25;;28;;/2;;14;;12;;/Ig'  -e \
    's/28;;36;;41;;/2;;18;;16;;/Ig'  -e \
    's/stroke-width:2;stroke-miterlimit:4;stroke-dasharray:none;/stroke-width:1;stroke-miterlimit:2;stroke-dasharray:none;/Ig'  -e \
    's/mix(0.8, @accent_color, @fg_color)/mix(0.5, @accent_color, @fg_color)/Ig'
}


build_black-maia-theme() {
    cd "adapta-black-maia-theme-${pkgver}"
    msg "Apply Black Maia theme"

    find . -type f -name '*.*' -exec sed -i \
    "s/#00BCD4/#16a085/Ig" {} \;

    _adapta-black

    ./autogen.sh --prefix "${pkgdir}/usr" \
      --enable-plank \
      --enable-telegram \
      --enable-parallel #--enable-gtk_next
    make
}

build_black-breath-theme() {
    cd "adapta-black-breath-theme-${pkgver}"
    msg "Apply Black Breath theme"

    find . -type f -name '*.*' -exec sed -i \
      "s/#00BCD4/#1abc9c/Ig;\
      s/#009688/#1abc9c/Ig;\
      s/#4DB6AC/#2fe2bf/Ig" {} \;

    _adapta-black

    ./autogen.sh --prefix "${pkgdir}/usr" \
      --enable-plank \
      --enable-telegram \
      --enable-parallel #--enable-gtk_next
    make
}

package_adapta-maia-theme() {
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines.Build with Manjaro Maia color"
conflicts=('adapta-maia-theme-dev')
replaces=('adapta-maia-theme-dev')
    build_maia-theme
    #cd "adapta-maia-theme-${pkgver}"
    make install
    install -dm 755 "${pkgdir}"/usr/share/plank/themes
    ln -s /usr/share/themes/Adapta-Maia/plank "${pkgdir}"/usr/share/plank/themes/Adapta-Maia

      install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-maia-theme/

    # Move the file into another folder to match with name
    cd "$pkgdir/usr/share/themes"
    mv Adapta Adapta-Maia
    mv Adapta-Nokto Adapta-Nokto-Maia
    mv Adapta-Eta Adapta-Eta-Maia
    mv Adapta-Nokto-Eta Adapta-Nokto-Eta-Maia

    # Modify the index theme
    sed -i -e 's,.*Adapta.*,Adapta-Maia,' $pkgdir/usr/share/themes/Adapta-Maia/index.theme
    sed -i -e 's,.*Adapta-Nokto.*,Adapta-Nokto-Maia,' $pkgdir/usr/share/themes/Adapta-Nokto-Maia/index.theme
    sed -i -e 's,.*Adapta-Eta.*,Adapta-Eta-Maia,' $pkgdir/usr/share/themes/Adapta-Eta-Maia/index.theme
    sed -i -e 's,.*Adapta-Nokto-Eta.*,Adapta-Nokto-Eta-Maia,' $pkgdir/usr/share/themes/Adapta-Nokto-Eta-Maia/index.theme

    # New symlink
    cd "$pkgdir/usr/share/themes/Adapta-Nokto-Maia"
    ln -sf /usr/share/themes/Adapta-Maia/xfwm4 xfwm4
    ln -sf /usr/share/themes/Adapta-Maia/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Maia/gedit gedit
    ln -sf /usr/share/themes/Adapta-Maia/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Maia/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Maia/gtk-3.0 gtk-3.0

    cd "$pkgdir/usr/share/themes/Adapta-Eta-Maia"
    ln -sf /usr/share/themes/Adapta-Maia/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Maia/telegram telegram
    ln -sf /usr/share/themes/Adapta-Maia/metacity-1 metacity-1

    cd "$pkgdir/usr/share/themes/Adapta-Nokto-Eta-Maia"
    ln -sf /usr/share/themes/Adapta-Eta-Maia/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Maia/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Nokto-Maia/telegram telegram
    ln -sf /usr/share/themes/Adapta-Maia/xfce-notify-4.0 xfce-notify-4.0
}

package_adapta-breath-theme() {
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines.Build with Manjaro Breath color"
conflicts=('adapta-breath-theme-dev')
replaces=('adapta-breath-theme-dev')
    build_breath-theme
    #cd "adapta-breath-theme-${pkgver}"
    make install

    install -dm 755 "${pkgdir}"/usr/share/plank/themes
    ln -s /usr/share/themes/Adapta-Breath/plank "${pkgdir}"/usr/share/plank/themes/Adapta-Breath

    install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-breath-theme/

    # Move the file into another folder to match with name
    cd "$pkgdir/usr/share/themes"
    mv Adapta Adapta-Breath
    mv Adapta-Nokto Adapta-Nokto-Breath
    mv Adapta-Eta Adapta-Eta-Breath
    mv Adapta-Nokto-Eta Adapta-Nokto-Eta-Breath

    # Modify the index theme
    sed -i -e 's,.*Adapta.*,Adapta-Breath,' $pkgdir/usr/share/themes/Adapta-Breath/index.theme
    sed -i -e 's,.*Adapta-Nokto.*,Adapta-Nokto-Breath,' $pkgdir/usr/share/themes/Adapta-Nokto-Breath/index.theme
    sed -i -e 's,.*Adapta-Eta.*,Adapta-Eta-Breath,' $pkgdir/usr/share/themes/Adapta-Eta-Breath/index.theme
    sed -i -e 's,.*Adapta-Nokto-Eta.*,Adapta-Nokto-Eta-Breath,' $pkgdir/usr/share/themes/Adapta-Nokto-Eta-Breath/index.theme

    # New symlink
    cd "$pkgdir/usr/share/themes/Adapta-Nokto-Breath"
    ln -sf /usr/share/themes/Adapta-Breath/xfwm4 xfwm4
    ln -sf /usr/share/themes/Adapta-Breath/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Breath/gedit gedit
    ln -sf /usr/share/themes/Adapta-Breath/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Breath/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Breath/gtk-3.0 gtk-3.0

    cd "$pkgdir/usr/share/themes/Adapta-Eta-Breath"
    ln -sf /usr/share/themes/Adapta-Breath/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Breath/telegram telegram
    ln -sf /usr/share/themes/Adapta-Breath/metacity-1 metacity-1

    cd "$pkgdir/usr/share/themes/Adapta-Nokto-Eta-Breath"
    ln -sf /usr/share/themes/Adapta-Eta-Breath/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Breath/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Nokto-Breath/telegram telegram
    ln -sf /usr/share/themes/Adapta-Breath/xfce-notify-4.0 xfce-notify-4.0
}

#package_adapta-gtk-theme() {
#pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'

#    build_adapta-gtk-theme
    #cd $_pkgname-$pkgver
#    make DESTDIR="${pkgdir}" install

#    install -dm 755 "${pkgdir}"/usr/share/plank/themes
#    ln -s /usr/share/themes/Adapta/plank "${pkgdir}"/usr/share/plank/themes/Adapta

#    install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-gtk-theme/                                                                                                                                                                                                                                                                                                                                                                                                                 
#}

package_adapta-black-maia-theme() {
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines.Build with Manjaro Maia color Black version"
    build_black-maia-theme
    #cd "adapta-maia-theme-${pkgver}"
    make install

    install -dm 755 "${pkgdir}"/usr/share/plank/themes
    ln -s /usr/share/themes/Adapta-Black-Maia/plank "${pkgdir}"/usr/share/plank/themes/Adapta-Black-Maia
    install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-black-maia-theme/

    # Move the file into another folder to match with name
    cd "$pkgdir/usr/share/themes"
    mv Adapta Adapta-Black-Maia
    mv Adapta-Nokto Adapta-Black-Nokto-Maia
    mv Adapta-Eta Adapta-Black-Eta-Maia
    mv Adapta-Nokto-Eta Adapta-Black-Nokto-Eta-Maia

    # Modify the index theme
    sed -i -e 's,.*Adapta.*,Adapta-Black-Maia,' $pkgdir/usr/share/themes/Adapta-Black-Maia/index.theme
    sed -i -e 's,.*Adapta-Nokto.*,Adapta-Black-Nokto-Maia,' $pkgdir/usr/share/themes/Adapta-Black-Nokto-Maia/index.theme
    sed -i -e 's,.*Adapta-Eta.*,Adapta-Black-Eta-Maia,' $pkgdir/usr/share/themes/Adapta-Black-Eta-Maia/index.theme
    sed -i -e 's,.*Adapta-Nokto-Eta.*,Adapta-Black-Nokto-Eta-Maia,' $pkgdir/usr/share/themes/Adapta-Black-Nokto-Eta-Maia/index.theme

    # New symlink
    cd "$pkgdir/usr/share/themes/Adapta-Black-Nokto-Maia"
    ln -sf /usr/share/themes/Adapta-Black-Maia/xfwm4 xfwm4
    ln -sf /usr/share/themes/Adapta-Black-Maia/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Black-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Maia/gedit gedit
    ln -sf /usr/share/themes/Adapta-Black-Maia/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Black-Maia/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Black-Maia/gtk-3.0 gtk-3.0

    cd "$pkgdir/usr/share/themes/Adapta-Black-Eta-Maia"
    ln -sf /usr/share/themes/Adapta-Black-Maia/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Black-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Maia/telegram telegram
    ln -sf /usr/share/themes/Adapta-Black-Maia/metacity-1 metacity-1

    cd "$pkgdir/usr/share/themes/Adapta-Black-Nokto-Eta-Maia"
    ln -sf /usr/share/themes/Adapta-Black-Eta-Maia/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Black-Maia/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Black-Maia/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Nokto-Maia/telegram telegram
    ln -sf /usr/share/themes/Adapta-Black-Maia/xfce-notify-4.0 xfce-notify-4.0
}

package_adapta-black-breath-theme() {
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines.Build with Manjaro Breath color Black version"
    build_black-breath-theme
    #cd "adapta-breath-theme-${pkgver}"
    make install

    install -dm 755 "${pkgdir}"/usr/share/plank/themes
    ln -s /usr/share/themes/Adapta-Black-Breath/plank "${pkgdir}"/usr/share/plank/themes/Adapta-Black-Breath

    install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/adapta-black-breath-theme/

    # Move the file into another folder to match with name
    cd "$pkgdir/usr/share/themes"
    mv Adapta Adapta-Black-Breath
    mv Adapta-Nokto Adapta-Black-Nokto-Breath
    mv Adapta-Eta Adapta-Black-Eta-Breath
    mv Adapta-Nokto-Eta Adapta-Black-Nokto-Eta-Breath

    # Modify the index theme
    sed -i -e 's,.*Adapta.*,Adapta-Black-Breath,' $pkgdir/usr/share/themes/Adapta-Black-Breath/index.theme
    sed -i -e 's,.*Adapta-Nokto.*,Adapta-Black-Nokto-Breath,' $pkgdir/usr/share/themes/Adapta-Black-Nokto-Breath/index.theme
    sed -i -e 's,.*Adapta-Eta.*,Adapta-Black-Eta-Breath,' $pkgdir/usr/share/themes/Adapta-Black-Eta-Breath/index.theme
    sed -i -e 's,.*Adapta-Nokto-Eta.*,Adapta-Black-Nokto-Eta-Breath,' $pkgdir/usr/share/themes/Adapta-Black-Nokto-Eta-Breath/index.theme

    # New symlink
    cd "$pkgdir/usr/share/themes/Adapta-Black-Nokto-Breath"
    ln -sf /usr/share/themes/Adapta-Black-Breath/xfwm4 xfwm4
    ln -sf /usr/share/themes/Adapta-Black-Breath/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Black-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Breath/gedit gedit
    ln -sf /usr/share/themes/Adapta-Black-Breath/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Black-Breath/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Black-Breath/gtk-3.0 gtk-3.0

    cd "$pkgdir/usr/share/themes/Adapta-Black-Eta-Breath"
    ln -sf /usr/share/themes/Adapta-Black-Breath/xfce-notify-4.0 xfce-notify-4.0
    ln -sf /usr/share/themes/Adapta-Black-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Breath/telegram telegram
    ln -sf /usr/share/themes/Adapta-Black-Breath/metacity-1 metacity-1

    cd "$pkgdir/usr/share/themes/Adapta-Black-Nokto-Eta-Breath"
    ln -sf /usr/share/themes/Adapta-Black-Eta-Breath/gtk-3.22 gtk-3.22
    ln -sf /usr/share/themes/Adapta-Black-Breath/metacity-1 metacity-1
    ln -sf /usr/share/themes/Adapta-Black-Breath/plank plank
    ln -sf /usr/share/themes/Adapta-Black-Nokto-Breath/telegram telegram
    ln -sf /usr/share/themes/Adapta-Black-Breath/xfce-notify-4.0 xfce-notify-4.0
}
