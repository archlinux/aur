# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Firef0x <Firefgx (at) gmail (dot) com>
# Contributor: sh0 <mee@sh0.org>
# Contributor: Lekensteyn <lekensteyn@gmail.com>

pkgname=smali
pkgver=2.0.6
pkgrel=1
pkgdesc="An assembler/disassembler for Android's dex format"
arch=('any')
url="http://code.google.com/p/smali/"
license=('BSD')
depends=('java-runtime' 'bash')
source=(baksmali-${pkgver}::https://bitbucket.org/JesusFreke/smali/downloads/baksmali
        baksmali-${pkgver}.jar::https://bitbucket.org/JesusFreke/smali/downloads/baksmali-${pkgver}.jar
        ${pkgname}-${pkgver}::https://bitbucket.org/JesusFreke/smali/downloads/smali
        ${pkgname}-${pkgver}.jar::https://bitbucket.org/JesusFreke/smali/downloads/smali-${pkgver}.jar
        ${pkgname}-${pkgver}-LICENSE::https://bitbucket.org/JesusFreke/smali/raw/7a03efcac6083f2d1b686521931b8dd4d983a304/NOTICE)
noextract=("${source[@]%%::*}")
sha512sums=('c95ddcb99cccb023a6f44d867d05de7d33afd81e86322e02bc448e15eb6bdaf0c32c74ad115720cccd2b5ae0ce6e59303cb45318c63c55387ef02f467c367cee'
            'dff8190c30db7a73765774283f505638c0e388455633bfaaeb42d3cb36c229fbb078b7ca094601dae524ee3b36873a7908b6fba3bbc7212b1b48b4213725d8d9'
            'b46a7d0c465b33148d95557ffd66fa575fc665fff792efb1187c3ea8640c2d81f04f82904cf828dba422ecf947ec4bb0929381dd17fea61eee5e373974683b7f'
            'f34ff3ccac3ece7465a7e2f17751b26c425c90d65d2da8bb5a266fda3cec39415797a8570a03ecc163028d13481c8166461c39245ebad4bbe84372f7651f90bc'
            'c3f1b71046ba062849a30edfbbe13df51ca72c3dea6799b9e0dd269fce196430d8e930b5f1b0d0a766797d9e80da50ae605c45789b51ac2376bc75d5e81118ec')

prepare() {
  for file in baksmali smali; do
    # prevent from printing path on launch
    sed '/echo ${newProg}/d' -i "${file}-${pkgver}"
    # fix ls path
    sed 's|/bin/ls|/usr/bin/ls|' -i "${file}-${pkgver}"
  done
}

package() {
  install -d "${pkgdir}/usr/bin"
  for file in baksmali smali; do
    install -Dm 755 "${file}-${pkgver}" "${pkgdir}/usr/share/${pkgname}/${file}"
    install -Dm 644 "${file}-${pkgver}.jar" "${pkgdir}/usr/share/${pkgname}/${file}.jar"
    ln -s "/usr/share/${pkgname}/${file}" "${pkgdir}/usr/bin/${file}"
  done
  install -Dm 644 ${pkgname}-${pkgver}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
