# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=mcidasv-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="free, open source software for 3D geophysical data analysis and visualization"
url="http://www.ssec.wisc.edu/mcidas/software/v/"
license=('GPL3')
arch=('x86_64')
depends=("java-environment")
source=("http://www.ssec.wisc.edu/mcidas/software/v/stable/1.6/McIDAS-V_1.6_linux_x86-64_installer.sh")
sha512sums=('8b579859119baff43467763b9b516b48f39275152991d67574140134c8a1aba4d785822244e1bf466c1919ebd8ea0d6abb025f443b157c9f93b142bd3764f44a')

package() {
   mkdir -p $pkgdir/opt/McIDAS-V-System
   echo "Note: If questioned, use $pkgdir/opt/McIDAS-V-System' as install dir!"
   chmod 0755 McIDAS-V_1.6_linux_x86-64_installer.sh
   PATH=$PATH:$pkgdir/opt/ ./McIDAS-V_1.6_linux_x86-64_installer.sh
   sed -i '/Exec=/d' "$pkgdir/opt/McIDAS-V-System/McIDAS-V-System/Configure McIDAS-V.desktop"
   sed -i '/Name=Configure McIDAS-V/a Exec=/bin/sh \"/opt/McIDAS-V-System/McIDAS-V-System/runMcV-Config\"' "$pkgdir/opt/McIDAS-V-System/McIDAS-V-System/Configure McIDAS-V.desktop"
   sed -i '/Exec=/d' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/mcidasv.desktop
   sed -i '/Icon=/d' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/mcidasv.desktop
   sed -i '/Name=mcidasv/a Icon=/opt/McIDAS-V-System/McIDAS-V-System/mcidasv/mcidasv.png' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/mcidasv.desktop
   sed -i '/Name=mcidasv/a Exec=/bin/sh \"/opt/McIDAS-V-System/McIDAS-V-System/mcidasv\"' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/mcidasv.desktop
   sed -i '/Exec=/d' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/McIDAS-V.desktop
   sed -i '/Name=McIDAS-V/a Exec=/bin/sh \"/opt/McIDAS-V-System/McIDAS-V-System/runMcV\"' $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/McIDAS-V.desktop
   mkdir -p $pkgdir/usr/bin/
   ln -s /opt/McIDAS-V-System/McIDAS-V-System/runMcV $pkgdir/usr/bin/mcidasv
  # Install a desktop entry
  ## TODO: Get the icon
  install -Dm644 $pkgdir/opt/McIDAS-V-System/McIDAS-V-System/McIDAS-V.desktop "${pkgdir}/usr/share/applications/McIDAS-V.desktop"
  install -Dm644 "$pkgdir/opt/McIDAS-V-System/McIDAS-V-System/Configure McIDAS-V.desktop" "${pkgdir}/usr/share/applications/Configure McIDAS-V.desktop"
}
