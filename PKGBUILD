# $Id$
# Contributor: Chad Voegele <cavoegele@gmail.com>

pkgname=nand2tetris
pkgver=2.5
pkgrel=7
pkgdesc="Software suite accompanying Nand2Tetris course."
arch=('any')
url="http://www.nand2tetris.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://www.nand2tetris.org/software/nand2tetris.zip
        n2tCPUEmulator.run
        n2tVMEmulator.run
        n2tJackCompiler.run
        n2tHardwareSimulator.run
        n2tAssembler.run
        n2tCPUEmulator.desktop
        n2tVMEmulator.desktop
        n2tHardwareSimulator.desktop
        n2tAssembler.desktop
)
md5sums=('07768ec1fa67c7a4d7be23b298834d64'
         '9c06f1ca0a0323638a7523f0d4dd85a3'
         '99d421df02cb61b735c998e524889ca6'
         'f2d16dd061e09dcc128e944ba74da237'
         '19d7f3c833d2e689c122729151ba2e02'
         '06a58b051ef4cf27372ae92f1540a6f5'
         '3170c0923d01e8f70378d668ac8a2eed'
         'be9557bc67ba66c63f565bfcf35f2550'
         'fa26bd9b1d54bf67c357d560b0b545bc'
         'abf1c846bf3e9216bfaaea0acc0478f1')

package() {
  cd ${srcdir}/${pkgname}

  # just install tools directory
  cd tools
  for file in $(find . -type f -name "*.sh"); do
    install -Dm755 $file ${pkgdir}/usr/share/${pkgname}/$file
  done

  for file in $(find bin builtInVMCode builtInChips OS\
                -name "*.jar"\
                -or -name "*.html"\
                -or -name "*.txt"\
                -or -name "*.vm"\
                -or -name "*.gif"\
                -or -name "*.hdl"\
                -or -name "*.class"); do
    install -Dm644 $file ${pkgdir}/usr/share/${pkgname}/$file
  done

  for file in $(find ${srcdir} -name "*.run"); do
    install -Dm755 $file ${pkgdir}/usr/bin/$(basename ${file%.*})
  done

  for file in $(find ${srcdir} -name "*.desktop"); do
    install -Dm644 $file ${pkgdir}/usr/share/applications/$(basename ${file})
  done
}
