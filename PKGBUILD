# Maintainer: Muflone <muflone@vbsimple.net>

pkgname=pygtk-object-browser
pkgver=0.9.9
pkgrel=1
pkgdesc="Browse and inspect gtk and gdk objects"
arch=('any')
url="http://code.google.com/p/pygtk-object-browser/"
license=('GPL2')
depends=('pygtk' 'xdg-utils')
source=("http://pygtk-object-browser.googlecode.com/svn/trunk/releases/PyGtkObjectBrowser-${pkgver}.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('76ca6b7f260c4d22ff362a854c7655e0'
         '7fb90afaa228f25b62deacbdb5a2a1fe'
         '9e1f1a19c5700b726b74aefd255a6bea')
install="${pkgname}.install"

prepare() {
  sed -i 's@^#!.*python$@#!/usr/bin/env python2@' "PyGtkObjectBrowser.py"
}

package() {
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "PyGtkObjectBrowser.glade" "README" "icon.png"
  for file in *.py
  do
    install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "${file}"
  done
  install -m 755 -t "${pkgdir}/usr/share/${pkgname}" "PyGtkObjectBrowser.py"

  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -m 755 -d "${pkgdir}/usr/share/${pkgname}/data"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}/data" "data/db.dat"

  install -m 755 -d "${pkgdir}/usr/share/${pkgname}/data/imgs/etc"
  for file in data/imgs/etc/*
  do
    install -m 644 -t "${pkgdir}/usr/share/${pkgname}/data/imgs/etc" "${file}"
  done

  install -m 755 -d "${pkgdir}/usr/share/${pkgname}/data/imgs/objects"
  for file in data/imgs/objects/*
  do
    install -m 644 -t "${pkgdir}/usr/share/${pkgname}/data/imgs/objects" "${file}"
  done

  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -D "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 644 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
