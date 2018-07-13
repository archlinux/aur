# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='qx-entity-editor'
pkgver=1.2.2
pkgrel=1
pkgdesc="A graphic editor for QxOrm library."
arch=('x86_64' 'i686')
url="https://www.qxorm.com/qxorm_en/home.html"
license=('GPL-3.0')
# "/mnt/D/Document/WorkSpace/Packages/AUR/qxentityeditor/QxEntityEditor_1.2.2_linux_64b.tar.gz"
source_x86_64=("https://www.qxorm.com/version/QxEntityEditor/${pkgver}/QxEntityEditor_${pkgver}_linux_64b.tar.gz"
              "Qx.png"
              "QxEntityEditor.desktop"
              "MyQxEntityEditorLauncher.sh"
              )
source_i686=("https://www.qxorm.com/version/QxEntityEditor/${pkgver}/QxEntityEditor_${pkgver}_linux_32b.tar.gz"
            "Qx.png"
            "QxEntityEditor.desktop"
            "MyQxEntityEditorLauncher.sh"
            )
sha256sums_x86_64=('cfcbb7ce47b7d599f8372cfb4a5e6cdd676fdb1b42f604d8a6ed3c80ca0e0896'
                  '869286123d353ac0f7c21d2d387a08dd58075cad1d27c7088dae7ab3967c3a04'
                  '33afd0cc0bd9196191df3708095f224de83c67060666c7e937fd2dd985825466'
                  '6565e7dc0c4a49e661ae9cae387c3387ff5a20ce79f2f4f1e64ef158c3d638e3'
                  )
sha256sums_i686=('SKIP')

package() {
  cd $srcdir

  _pkg=QxEntityEditor_Linux_64b
  if [ "${CARCH}" = "i686" ]; then
    _pkg=QxEntityEditor_Linux_32b
  fi

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}" -R
  cp $srcdir/MyQxEntityEditorLauncher.sh ${pkgdir}/opt/${pkgname}
  cp $srcdir/Qx.png ${pkgdir}/opt/${pkgname}
  cp $srcdir/QxEntityEditor.desktop ${pkgdir}/opt/${pkgname}

  # ln -s /opt/${pkgname}/MyQxEntityEditorLauncher.sh "${pkgdir}"/usr/bin/MyQxEntityEditorLauncher.sh
  install -Dm755 ${srcdir}/MyQxEntityEditorLauncher.sh ${pkgdir}/usr/bin/MyQxEntityEditorLauncher.sh
  install -Dm755 ${srcdir}/Qx.png ${pkgdir}/usr/share/icons/${pkgname}.png
  install -Dm644 ${srcdir}/QxEntityEditor.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  chmod +x ${pkgdir}/usr/bin/MyQxEntityEditorLauncher.sh
}