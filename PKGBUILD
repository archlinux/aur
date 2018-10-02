# Maintainer: Étienne Deparis <etienne@depar.is>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=bluecurve-icon-theme
pkgver=8.0.2
pkgrel=21
_rhfedver=28
_rhpkgrel=18
pkgdesc="Red Hat Icons from Fedora 10"
arch=('any')
url="https://fedorahosted.org/bluecurve/"
license=('GPL')
groups=('redhat-artwork')
optdepends=('gnome-icon-theme: for inheriting missing icons')
options=(!emptydirs)

source=("ftp://rpmfind.net/linux/fedora/linux/releases/${_rhfedver}/Everything/x86_64/os/Packages/b/bluecurve-icon-theme-${pkgver}-${_rhpkgrel}.fc${_rhfedver}.noarch.rpm")
sha256sums=('471908572f21ce9c2cb82582f29904c1d9e0593ac8ca6cfdf3795a730ab4d936')

build() {
  cd $srcdir/usr/share/icons
  mv Bluecurve BluecurveRH

  sed -i "s/^Name=Bluecurve$/Name=BluecurveRH/" BluecurveRH/index.theme
  sed -i "s/^Context=FileSystems$/Context=Places/" BluecurveRH/index.theme
  sed -i "s|^\[\(.*\)/status\]$|[\1/status]\nContext=Status|" BluecurveRH/index.theme

  find BluecurveRH -name '*.icon' -exec rm {} \;

  for size in 16x16 24x24 32x32 36x36 48x48; do
    cd $srcdir/usr/share/icons/BluecurveRH/$size/filesystems
    ln -s ../apps/desktop.png user-desktop.png
    ln -s ../apps/icon-network-systems.png network-server.png
    ln -s ../apps/icon-network-systems.png network-workgroup.png

    ## Uncomment the following lines to use the Red Hat logo instead of
    ## default gnome foot
    # ln -s ../../$size/apps/redhat-icon-panel-menu.png start-here.png
    # ln -s ../../$size/apps/redhat-icon-panel-menu.png distributor-logo.png

    [ ! -d ../status ] && mkdir ../status
    cd ../status
    for icon in $(find ../apps -type f -name 'gpm-*'); do
      mv $icon .
    done
    for icon in $(find . -type f -name 'gpm-primary*' -printf "%f\n"); do
      ln -s $icon ${icon/primary/battery}
    done
    ln -s gpm-primary-080-charging.png battery-good-charging.png
    ln -s gpm-primary-100-charging.png battery-full-charging.png
    ln -s gpm-primary-100-charged.png battery-full-charged.png
    ln -s gpm-primary-100.png battery-full.png
    ln -s gpm-primary-missing.png battery-missing.png
    ln -s gpm-primary-080.png battery-good.png
    ln -s gpm-primary-020.png battery-low.png
    ln -s gpm-primary-010.png battery-empty.png
    ln -s gpm-primary-020-charging.png battery-low-charging.png
    if [ -f ../stock/printer-broken.png ]; then
        ln -s ../stock/printer-broken.png battery-caution-charging.png
        ln -s ../stock/printer-broken.png battery-caution.png
    fi

    [ ! -d ../actions ] && mkdir ../actions
    cd ../actions
    [ -f connect_no.png ] && ln -s connect_no.png system-shutdown.png
    [ -f ../status/gpm-hibernate.png ] && mv ../status/gpm-hibernate.png .
    [ -f ../status/gpm-suspend.png ] && mv ../status/gpm-suspend.png .
    ln -s ../apps/gnome-searchtool.png system-search.png
    ln -s ../apps/gnome-run.png system-run.png

    cd ../apps
    [ -f ../status/gpm-ac-adapter ] && mv ../status/gpm-ac-adapter.png .
    [ -f ../status/gpm-brightness.png ] && mv ../status/gpm-brightness.png .
    rm icon-system-settings.png
    ln -s preferences-desktop-wallpaper.png icon-system-settings.png
    ln -s file-manager.png caja.png
    ln -s file-manager.png system-file-manager.png
    ln -s ../mimetypes/user-home.png caja_home.png
    ln -s gdm.png lightdm-gtk-greeter-settings.png
    ln -s icon-network-systems.png mate-network-properties.png
    ln -s gnome-grecord.png multimedia-volume-control.png
    ln -s ../status/gpm-primary-100-charging.png mate-power-manager.png
    ln -s gnome-ccwindowmanager.png preferences-system-windows.png
    ln -s display-capplet.png mate-preferences-desktop-display.png
    ln -s display-capplet.png preferences-desktop-display.png
    ln -s display-capplet.png display.png
    ln -s gnome-run.png mate-run.png
    ln -s gnome-ccperiph.png preferences-desktop-peripherals.png
    ln -s gaim.png mate-notification-properties.png
    ln -s gnome-settings-keybindings.png preferences-desktop-keyboard-shortcuts.png
    ln -s 500_setup.png preferences-desktop-default-applications.png
    ln -s gnome-panel.png mozo.png
    ln -s gnome-panel.png alacarte.png
    ln -s gnome-panel.png mate-panel.png
    ln -s gnome-log.png mate-system-log.png
    ln -s gnome-session.png mate-session-properties.png
    ln -s icon-user-id.png user-info.png
    ln -s gnome-color-xterm.png utilities-terminal.png
    ln -s utilities-system-monitor.png mate-power-statistics.png
    ln -s accessories-text-editor.png emacs.png
    ln -s email.png thunderbird.png
    # ln -s galeon.png firefox.png
    if [ "$size" != "36x36" ]; then
        ln -s openofficeorg-writer.png libreoffice-writer.png
        ln -s openofficeorg-calc.png libreoffice-calc.png
        ln -s openofficeorg-math.png libreoffice-math.png
        ln -s openofficeorg-base.png libreoffice-base.png
        ln -s openofficeorg-impress.png libreoffice-impress.png
        ln -s openofficeorg-draw.png libreoffice-draw.png
    fi
    ln -s gpm-brightness.png mate-brightness-applet.png
    ln -s gnome-clock.png mate-panel-clock.png
    ln -s icon-launcher.png mate-panel-launcher.png
    ln -s icon-memory-profile.png mate-cpu-frequency-applet.png
    ln -s icon-traceroute.png mate-netspeed-applet.png
    ln -s gnome-ccwindowmanager.png mate-panel-window-menu.png
    ln -s gnome-ccwindowmanager.png mate-panel-window-list.png
    ln -s utilities-system-monitor.png mate-invest-applet.png
    ln -s display-capplet.png mate-panel-workspace-switcher.png
    ln -s ../actions/gpm-suspend.png mate-inhibit-applet.png
    if [ -d ../stock ]; then
        ln -s ../stock/panel-launcher.png applications-science.png
        ln -s ../stock/panel-launcher.png package_science.png
        ln -s ../stock/panel-drawer.png mate-panel-drawer.png
        ln -s ../stock/panel-amusements.png mate-eyes-applet.png
        ln -s ../stock/panel-amusements.png mate-panel-fish.png
        ln -s ../stock/dialog-information.png mate-panel-notification-area.png
        ln -s ../stock/dialog-cancel.png mate-panel-force-quit.png
    fi

    [ ! -d ../devices ] && mkdir ../devices
    cd ../devices
    ln -s ../apps/gpm-ac-adapter.png ac-adapter.png
    ln -s ../status/gpm-primary-100-charging.png battery.png
  done

  for size in 16x16 24x24 48x48 96x96; do
    cd $srcdir/usr/share/icons/BluecurveRH/$size/mimetypes
    ln -s openofficeorg-drawing.png libreoffice-drawing.png
    ln -s openofficeorg-presentation-template.png libreoffice-presentation-template.png
    ln -s openofficeorg-oasis-text-template.png libreoffice-oasis-text-template.png
    ln -s openofficeorg-presentation.png libreoffice-presentation.png
    ln -s openofficeorg-spreadsheet-template.png libreoffice-spreadsheet-template.png
    ln -s openofficeorg-oasis-drawing.png libreoffice-oasis-drawing.png
    ln -s openofficeorg-oasis-text.png libreoffice-oasis-text.png
    ln -s openofficeorg-oasis-web-template.png libreoffice-oasis-web-template.png
    ln -s openofficeorg-oasis-spreadsheet.png libreoffice-oasis-spreadsheet.png
    ln -s openofficeorg-oasis-presentation.png libreoffice-oasis-presentation.png
    ln -s openofficeorg-text-template.png libreoffice-text-template.png
    ln -s openofficeorg-oasis-master-document.png libreoffice-oasis-master-document.png
    ln -s openofficeorg-spreadsheet.png libreoffice-spreadsheet.png
    ln -s openofficeorg-text.png libreoffice-text.png
    ln -s openofficeorg-drawing-template.png libreoffice-drawing-template.png
    ln -s openofficeorg-oasis-drawing-template.png libreoffice-oasis-drawing-template.png
    ln -s openofficeorg-oasis-spreadsheet-template.png libreoffice-oasis-spreadsheet-template.png
    ln -s openofficeorg-oasis-presentation-template.png libreoffice-oasis-presentation-template.png
  done

  cd $srcdir/usr/share/icons/BluecurveRH
  find -L . -type l -exec rm {} \;
}

package() {
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  cd $srcdir/usr/share/doc/$pkgname
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 AUTHORS $pkgdir/usr/share/licenses/$pkgname/AUTHORS

  cp -R $srcdir/usr/share/icons/BluecurveRH $pkgdir/usr/share/icons/
}
