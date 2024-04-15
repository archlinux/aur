# Maintainer: sachin <sachinsenal0x64@gmail.com>
# Github: https://github.com/sachinsenal0x64

pkgname='yaksha'
pkgver='0.0.8'
prev='vP20240414.f76ff03'
pkgrel='0'
pkgdesc='A Programming language with off-side rule syntax,and YakshaLisp sublanguage.'
arch=('x86_64')
url='https://github.com/YakshaLang/Yaksha'
license=('GPL-3.0')
provides=('yaksha')
conflicts=('yaksha')
source=("https://github.com/YakshaLang/Yaksha/releases/download/vP20240414.f76ff03/yaksha_vP20240414.f76ff03_linux-x86_64.tar.gz")
sha256sums=('67b22d12acb3adc6eaf3d3350154c9442032b873ffbd23a0de3154ec16472b78')
depends=('zig')

prepare() {
    tar -xzf "${srcdir}/yaksha_${prev}_linux-x86_64.tar.gz" -C "${srcdir}"
    local inner_folder=$(tar -tzf "${srcdir}/yaksha_${prev}_linux-x86_64.tar.gz" | grep -o '^[^/]*/' | uniq)
    if [ -d "${srcdir}/${inner_folder}" ]; then
        mv "${srcdir}/${inner_folder}"/* "${srcdir}/"  # Move contents to srcdir root
        rmdir "${srcdir}/${inner_folder}"  # Remove the now empty inner folder
    fi
}

build() {
    echo "Building Yaksha..."
    
    cd "${srcdir}"

  }

package() {

      echo "Installing binaries and libraries..."

         
      # Copy binaries and set execute permissions
      install -Dm755 bin/yaksha "${pkgdir}/usr/local/bin/yaksha"
      install -Dm755 bin/hammer "${pkgdir}/usr/local/bin/hammer"
      install -Dm755 bin/carpntr "${pkgdir}/usr/local/bin/carpntr"

      # Remove old directories if they exist and copy new ones
      if [ -d "${pkgdir}/usr/local/runtime" ]; then
          rm -rf "${pkgdir}/usr/local/runtime"
      fi
      cp -r runtime "${pkgdir}/usr/local/runtime"

      if [ -d "${pkgdir}/usr/local/libs" ]; then
          rm -rf "${pkgdir}/usr/local/libs"
      fi
      cp -r libs "${pkgdir}/usr/local/libs"

      if [ -d "${pkgdir}/usr/local/lib" ]; then
          rm -rf "${pkgdir}/usr/local/lib"
      fi
      cp -r bin/lib "${pkgdir}/usr/local/lib"

      if [ -d "${pkgdir}/usr/local/doc" ]; then
          rm -rf "${pkgdir}/usr/local/doc"
      fi
      cp -r bin/doc "${pkgdir}/usr/local/doc"   


      # Clean up: remove the extracted folder
      rm -rf "$srcdir"

      echo "Installation and test build complete. Done!"
    
}

