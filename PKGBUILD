pkgname=ntfs3-dkms
pkgver=11.0.0
pkgrel=1
pkgdesc="NTFS read-write driver GPL implementation by Paragon Software. Current version works with NTFS (including v3.1), normal/compressed/sparse files and supports journal replaying."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=(Makefile.patch
        dkms.conf
        "v$pkgver~1.patch::https://lore.kernel.org/patchwork/patch/1329711/raw"
        "v$pkgver~2.patch::https://lore.kernel.org/patchwork/patch/1329716/raw"
        "v$pkgver~3.patch::https://lore.kernel.org/patchwork/patch/1329707/raw"
        "v$pkgver~4.patch::https://lore.kernel.org/patchwork/patch/1329712/raw"
        "v$pkgver~5.patch::https://lore.kernel.org/patchwork/patch/1329710/raw"
        "v$pkgver~6.patch::https://lore.kernel.org/patchwork/patch/1329709/raw"
        "v$pkgver~7.patch::https://lore.kernel.org/patchwork/patch/1329713/raw"
        "v$pkgver~8.patch::https://lore.kernel.org/patchwork/patch/1329715/raw")
sha512sums=('ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '5f4087b05eb831fe277f1894240a8d72824daa821317e873f77574fc25d97b273ac3ddd8075d58b96c5e4e441de630817d68a3fa33d6176e26743cdb17ec664f'
            '9735df4870d8d7e1a2a116dbe018d9648382a1f3af5a68f7d5c7e13c6abf2504060e2671439524c3883b4bbf72b34b4952857ea49fe47992587475f87cfa5a21'
            '58850bdd1612a9e357d169c3f19ac013b01ddddf0619a0be592ca394a5826ac43851d883307755626089ad1f4f98271a1a342bfb8d2faaca10f6163c3f967441'
            '17d1e267baca8ba75f5245726d1815e74a2ef8dfe18c6c08118a2f0f125c2ace98ac7ab70d017be51a0fc40236c59faac6813efc523270f52668a3978f1c343d'
            'c0e6b54b27708e56ae389795d58119e4d2bcc41551e43e6bd42a737c803217bc1906c5e3d0aedd721346480d2830f114058f8e16f0b7791f19c7ddeb4743a3f2'
            '098616815d24a8b6224293f4806295588c3e2d572e8cafa4d17e89e62ccaaca3500c68cbac897005c9eb39b8cfefb4b6ea04c6b6731c5b929630eb18698957ca'
            '671b8ade7ea39f4defea119f7e2bcec200d5b73174589f308bc60d37fad11bf2cedc0cdaebd26eb22e98807e448f710263c5c911e9eff120b30650c9e1108029'
            '4e810bd240c7957b40cfc26bd0601123c79c279ef44b202c5de5907ec3a313b68a95d7916bbea17a2029a43695b7f34afc4bb156fa9f9aa585f00e8b17d20138'
            'b1c770c2a60992513cfc815669323d2c07bbe4d344428ab2499881b55ed2421c26ad59960aaaf4959470868413e3ec5ecb0d34891e6746252b9265adfc28b074')


prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  for patch in "$srcdir/v$pkgver~"*
  do
    patch -p3 -N -i "$patch"
  done
  patch -p1 -N -i "$srcdir/Makefile.patch"
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
