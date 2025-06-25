# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

_product="MATLAB"
_name="$(echo "${_product}" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -d '()')"
pkgbase="${_name}"
pkgname=({,java-}"${pkgbase}")
pkgver=R2025a.25.1.0.2943329
_pkgver="$(sed -E 's/^(R20[0-9]{2}[ab]).*/\1/' <<< "${pkgver}")"
pkgrel=6
epoch=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=('x86_64')
url="https://www.mathworks.com/products/matlab.html"
license=('custom:MATLAB EULA')
depends=(
  # https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps
  # Arch                  # Debian / RHEL                  Notes
  'alsa-lib'              # libasound2t64
  'ca-certificates'       # ca-certificates
  'cairo'                 # libcairo-gobject2
                          # libcairo2
  # 'debianutils'         # debianutils                    not required on either Arch or RHEL
  'fontconfig'            # libfontconfig1
  'fribidi'               # libfribidi0
  'gcc-libs'              # libatomic1
  'gdk-pixbuf2'           # libgdk-pixbuf-2.0-0
  'glib2'                 # libglib2.0-0t64
  'glibc'                 # libc6
  # 'glibc-locales'       # locales                        optdepends
  'gst-plugins-base-libs' # libgstreamer-plugins-base1.0-0 
  'gstreamer'             # libgstreamer1.0-0
  # 'gtk3'                # libgtk-3-0t64                  not linked, not referenced
  'libcap'                # libcap2
  # 'libcups'             # libcups2t64                    optdepends
  'libdrm'                # libdrm2
  'libgl'                 # libgl1
  'libice'                # libice6
  # 'libltdl'             # libltdl7                       not linked, not referenced
  # 'libprocps'           # procps                         not linked, not referenced
  'libsndfile'            # libsndfile1
  'libtirpc'              # libtirpc3t64
  # 'libuhd'              # libuhd4.6.0-dpdk               not linked, not referenced
  'libxcomposite'         # libxcomposite1
  # 'libxcrypt-compat'    # libcrypt1                      apr-util, subversion
  'libxcursor'            # libxcursor1
  'libxdamage'            # libxdamage1
  'libxfixes'             # libxfixes3
  # 'libxfont2'           # libxfont2                      not linked, not referenced
  'libxft'                # libxft2
  'libxinerama'           # libxinerama1
  'libxrandr'             # libxrandr2
  'libxt'                 # libxt6t64
  # 'libxtst'             # libxtst6                       not linked, not referenced
  'libxxf86vm'            # libxxf86vm1                    TODO
  'make'                  # make                           referenced by ?
  'mesa'                  # libgbm1
  'net-tools'             # net-tools                      not linked, referecned by libcef.so
  'nspr'                  # libnspr4
  'nss'                   # libnss3
  # 'numactl'             # libnuma1                       not linked, not referenced
  # 'opa-psm2'            # libpsm2-2                      not linked, not referenced
  # 'openucx'             # libucx0                        not linked, not referenced
  'pam'                   # libpam0g
  'pango'                 # libpango-1.0-0
                          # libpangocairo-1.0-0 
                          # libpangoft2-1.0-0
  'pixman'                # libpixman-1-0
  # 'rdma-core'           # ibverbs-providers              not linked, not referenced
                          # libibverbs1 
                          # librdmacm1t64 
  'sudo'                  # sudo                           referenced by ?
  'unzip'                 # unzip                          referenced by ?
  'util-linux-libs'       # libuuid1
  # 'wayland'             # libwayland-client0             optdepends
  'which'                 # which.x86_64                   referenced by ?
  # 'xorg-setxkbmap'      # x11-xkb-utils                  not linked, not referenced
  # 'xorg-xkbbell'                                         not linked, not referenced, doesn't exist
  # 'xorg-xkbcomp'                                         not linked, not referenced
  # 'xorg-xkbevd'                                          not linked, not referenced
  # 'xorg-xkbprint'                                        not linked, not referenced
  # 'xorg-xkbvleds'                                        not linked, not referenced, doesn't exist
  # 'xorg-xkbwatch'                                        not linked, not referenced, doesn't exist
  'zlib'                  # zlib1g

  # removed manually
  'at-spi2-core'
  'fluxbox'
  'gtk2'
  # 'libgl'
  'glu'
  # 'gcc-libs'
  'hunspell-en_us'
  #'openjade' TODO
  'xorg-server-xvfb'

  'sh'
)
makedepends=('gendesk' 'inotify-tools' 'matlab-mpm>=2025.1') # "matlab-mpm-version>=${_pkgver}" 'patchelf'
source=("${pkgbase}_jenv.hook")
sha256sums=('396187ed4f1a516327fbce96140114983a17d6e64988f0c5d95d036353c0fe51')

declare -Ag _deps=(
  # replace depends
  # paid?   MATLAB
  # [ahformatter]="libAHCGM libAHCommon libAHFontService libAHGraphicService libAHMathML libAHPDFLib libAHRasterizer libAHskia libAHSVG libOOXMLCreator libPDFCreator libPDFLinearizer libPDFRes libPDFToolPage libPSCreator libSVGCreator libXfoCommon libXfoEngine libXfoFont libXfoGraphic libXfoHyphen libXfoInterface libXfoRender libXfoText libXfoTrans libXPSCreator" # 7.4
  # version MATLAB
  # [antlr4-runtime]="libantlr4-runtime" # 4.9.1
  # yes     MATLAB, apr-util, subversion
  [apr]="libapr-1" # 0.7.5
  # yes     MATLAB, subversion
  [apr-util]="libaprutil-1" # 0.6.1
  # version MATLAB
  # [avro-cpp]="libavrocpp" # 1.11.1
  # version MATLAB, aws-sdk-cpp-s3
  # [aws-sdk-cpp-core]="libaws-cpp-sdk-core" # no
  # version MATLAB
  # [aws-sdk-cpp-s3]="libaws-cpp-sdk-s3 libaws-cpp-sdk-transfer" # no
  # yes     MATLAB
  [cfitsio9]="libcfitsio" # 9.4.1.0
  # version MATLAB
  # [cmark]="libcmark" # 0.30.2
  # NO      MATLAB, aws-sdk-cpp-s3
  # [curl]="libcurl" # 4.8.0 incompatible ABI
  # version MATLAB
  # [dbus]="libdbus-1" # 3.34.0
  # version MATLAB
  # [expat]="libexpat" # 1.9.3
  # yes     MATLAB
  [freetype2]="libfreetype" # 6.18.3
  # ?       MATLAB, hdf4-eos?
  # [gcptc]="libGctp" # 0.0.0
  # name?   MATLAB
  # [giflib]="libgif" # 7.2.0 called libgiflib?
  # version MATLAB, mpfr1
  # [gmp4]="libgmp" # 3.4.1
  # version MATLAB, hdf4-eos?
  # [hdf4]="libdf libmfhdf" # 0.0.0
  # version MATLAB
  # [hdf4-eos]="libhdfeos" # ? 0.0.0
  # version MATLAB
  # [hdf5]="libhdf5 libhdf5_hl" # 310.0.4
  # yes     MATLAB
  [hunspell]="libhunspell-1.7" # 0.0.1
  # no      yes    ahformatter
  # [icu74]="libicudata libicui18n libicuio libicutest libicutu libicuuc" # incompatible ABI
  # version yes    hdf5
  # [libaec]="libaec libsz" # 0.1.2 2.0.1
  # version yes    ?
  # [libarchive]="libarchive" # 13.7.7
  # version no     no ???
  # [libbsd]="libbsd" # 0.8.4
  # version MATLAB
  # [libgit2]="libgit2" # 1.9.0
  # version MATLAB
  # [libpng]="libpng16" # 16.44.0
  # yes     MATLAB
  [libsm]="libSM" # 6.0.1
  # yes     MATLAB, aws-cpp-sdk-s3, libgit2
  [libssh2]="libssh2" # 1.0.1
  # yes     MATLAB
  [libtiff]="libtiff"
  # version MATLAB
  # [libunwind]="libunwind" # 8.0.1
  # version MATLAB
  # [libutf8proc2]=libutf8proc # 2.5.0
  # yes     MATLAB
  [libx11]="libX11 libX11-xcb" # 6.4.0 1.0.0
  # yes     MATLAB
  [libxau]="libXau" # 6.0.0
  # yes     MATLAB
  [libxcb]="libxcb-shm libxcb-xinerama libxcb libxcb-shape libxcb-sync libxcb-xkb libxcb-xfixes libxcb-randr libxcb-render"
  # yes     MATLAB
  [libxdmcp]="libXdmcp" # 6.0.0
  # yes     MATLAB
  [libxext]="libXext" # 6.4.0
  # yes     MATLAB
  [libxi]="libXi" # 6.1.0
  # yes     MATLAB
  [libxkbcommon]="libxkbcommon" # 0.0.0
  # yes     MATLAB
  [libxkbcommon-x11]="libxkbcommon-x11" # 0.0.0
  # yes     MATLAB
  [libxml2-legacy]="libxml2" # 2.13.4
  # yes     MATLAB
  [libxss]="libXss" # 1.0.0
  # yes     MATLAB
  [libxrender]="libXrender" # 1.3.0
  # yes     MATLAB
  [libxslt]="libxslt libexslt" # 1.1.42 0.8.23
  # no      MATLAB
  # [minizip-ng]="libminizip-ng" # 4.0.4
  # version MATLAB
  # [mpfr1]="libmpfr" # 1.2.2
  # yes     MATLAB
  [nanomsg]="libnanomsg" # 6.0.1
  # version MATLAB
  # [onetbb]="libtbbmalloc libtbb" # 2.7 12.7
  # version MATLAB
  # [openscenegraph]="libosgDB libosgFX libosgGA libosgManipulator libosgParticle libosgShadow libosgSim libosg libosgTerrain libosgText libosgUtil libosgViewer libosgVolume libOpenThreads" # 3.4.0 3.3.0
  # version MATLAB
  # [poco]="libPocoCrypto libPocoFoundation libPocoJSON libPocoNet libPocoNetSSL libPocoUtil libPocoXML libPocoZip" # 94
  # version MATLAB
  # [podofo-0.9]="libpodofo" # 0.9.6
  # yes     MATLAB
  [polyclipping]="libpolyclipping" # no
  # yes?    MATLAB
  # [portaudio]="libportaudio" # 2.0.0
  # version MATLAB, protobuf
  # [protobuf]="libprotobuf3 libprotoc" # 3.21.9.0
  # yes     MATLAB
  [qt5-base]="libQt5OpenGL libQt5Sql libQt5Test libQt5XcbQpa libQt5Core libQt5Gui libQt5Core libQt5PrintSupport libQt5Network libQt5Widgets libQt5DBus"
  # yes     MATLAB
  [qt5-gamepad]="libQt5Gamepad"
  # yes     MATLAB
  [qt5-svg]="libQt5Svg"
  # yes     no
  [qt5-websockets]="libQt5WebSockets"
  # yes     MATLAB
  [qt5-x11extras]="libQt5X11Extras"
  # yes     no
  [qt5-xmlpatterns]="libQt5Xml libQt5XmlPatterns"
  # no      MATLAB
  # [re2]="libre2" # no
  # version MATLAB, subversion
  [serf]="libserf-1" # 1.3.9 huh?
  # version MATLAB
  # [sundials]="libsundials_arkode libsundials_cvode libsundials_cvodes libsundials_ida libsundials_idas libsundials_nvecserial" # 4.7.0 5.7.0 5.7.0 5.7.0 4.7.0 5.7.0
  # version MATLAB
  # [sqlite]="libsqlite3" # 3.44.2
  # yes     MATLAB
  [subversion]="libsvn_client-1 libsvn_delta-1 libsvn_diff-1 libsvn_fs-1 libsvn_fs_fs-1 libsvn_fs_util-1 libsvn_fs_x-1 libsvn_ra-1 libsvn_ra_local-1 libsvn_ra_serf-1 libsvn_ra_svn-1 libsvn_repos-1 libsvn_subr-1 libsvn_wc-1"
  # yes     MATLAB
  # [systemd-libs]="libudev" # 0.13.0
  # version MATLAB
  # [tidy]="libtidy" # 5.8.0 huh?
  # yes     MATLAB
  [xalan-c]="libxalan-c libxalanMsg" # 112.0
  # yes     MATLAB/XCB
  [xcb-util]="libxcb-util" # 1.0.0
  # yes     MATLAB/XCB
  [xcb-util-image]="libxcb-image" # 0.0.0
  # yes     MATLAB/XCB
  [xcb-util-keysyms]="libxcb-keysyms" # 1.0.0
  # yes     MATLAB/XCB
  [xcb-util-renderutil]="libxcb-render-util" # 0.0.0
  # yes     MATLAB/XCB
  [xcb-util-wm]="libxcb-icccm" # 4.0.0
  # version MATLAB, xalan-c
  # [libxerces-c]="libxerces-c-3.2" no
  # version MATLAB
  # [zstd]="libzstd.so" # 1.5.5
)
declare -Ag _deps_exclude=(
  [libxss]=1
  [qt5-websockets]=1
  [qt5-xmlpatterns]=1
)
for dep in "${!_deps[@]}"; do
  [[ -n ${_deps_exclude[$dep]} ]] && continue
  depends+=("$dep")
done

prepare() {
  cd "${srcdir}"
  echo "  -> Cleaning old directories..."
  rm -rf download install install-java tmp
  mkdir -p download install install-java tmp

  echo "  -> Starting log watcher..."
  : > "tmp/mathworks_${USER}.log"
  tail -n 0 -F "tmp/mathworks_${USER}.log" |
    sed --unbuffered 's/^[^)]*) *//; s/^/    -> /' &
  tail_pid=$!

  echo "  -> Starting download progress watcher..."
  (
    inotifywait -mrq -e create --format '%w%f' download |
      while read -r f; do
        printf "\r\033[K    -> Downloading %s...\r" "${f#download/}"
      done
  ) &
  download_pid=$!

  echo "  -> Starting install progress watcher..."
  (
    inotifywait -mrq -e create --format '%w%f' install |
      while read -r f; do
        printf "\r\033[K    -> Installing %s...\r" "${f#install/}"
      done
  ) &
  install_pid=$!

  _cleanup() {
    echo "  -> Cleaning up background processes..."
    kill "$tail_pid" "$download_pid" "$install_pid" 2>/dev/null
    wait "$tail_pid" "$download_pid" "$install_pid" 2>/dev/null || true
  }
  trap _cleanup EXIT

  echo "  -> Downloading archives using MPM. This will take a while..."
  TMPDIR="${srcdir}/tmp" matlab-mpm download \
    --release="${_pkgver}" \
    --destination="${srcdir}/download" \
    --products="${_product// /_}" \
    --platforms="glnxa64" \
    --no-deps
  ret=$?

  if (( ret != 0 )); then
    echo "  ==> ERROR: MPM download failed with status $ret!"
    exit 1
  fi
  if [[ ! -d download || -z $(ls -A download) ]]; then
    echo "  ==> ERROR: MPM download succeeded but download directory is empty!"
    exit 1
  fi
  echo "  -> Download completed successfully."

  echo "  -> Installing archives using MPM. This will take a while..."
  TMPDIR="${srcdir}/tmp" matlab-mpm install \
    --source="${srcdir}/download" \
    --destination="${srcdir}/install" \
    --products="${_product// /_}" \
    --no-jre
  ret=$?

  if (( ret != 0 )); then
    echo "  ==> ERROR: MPM install failed with status $ret!"
    exit 1
  fi
  if [[ ! -d install || -z $(ls -A install) ]]; then
    echo "  ==> ERROR: MPM install succeeded but install directory is empty!"
    exit 1
  fi
  echo "  -> Install completed successfully."
  echo "  -> Ignore the above post-installation instructions (if any). They do not apply to you!"

  _cleanup
  trap - EXIT
}

pkgver() {
  cd "${srcdir}/install"
  local rel ver
  rel="$(sed -n 's:.*<release>\(.*\)</release>.*:\1:p' VersionInfo.xml)"
  ver="$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' VersionInfo.xml)"
  echo "$rel.$ver"
}

build() {
  cd "${srcdir}"
  echo "  -> Generating desktop file..."
  gendesk -f -n \
    --pkgname "${pkgbase}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_product}" \
    --comment 'Programming and numeric computing platform' \
    --exec "${pkgbase} -desktop -useStartupFolderPref" \
    --icon "/opt/MATLAB/${_pkgver}/bin/glnxa64/cef_resources/matlab_icon.png" \
    --categories 'Development;Education;Science;Mathematics;IDE' \
    --mimetypes 'application/x-matlab-data;text/x-matlab'

  cd "${srcdir}/install"
  echo "  -> Separating Java components..."
  mv "java" "${srcdir}/install-java/java"

  cd "${srcdir}/install/bin/glnxa64"
  echo "  -> Removing unnecessary files..."
  rm -vf ./*.source # ldconfig complains about "not an ELF file - it has the wrong magic bytes at the start."

  # https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/issues/19
  # https://bbs.archlinux.org/viewtopic.php?pid=2225028#p2225028
  # echo "  -> Clearing executable stack to fix crashing issues..."
  # patchelf --clear-execstack "libmwfoundation_crash_handling.so"

  echo "  -> Removing bundled dependencies..."
  for dep in "${!_deps[@]}"; do
    echo "    -> Removing bundled ${dep} libraries..."
    for lib in ${_deps[$dep]}; do
      rm -vf "$lib.so"*
      rm -f "$lib".rights
    done
  done

  cd "${srcdir}/install/cefclient/sys"
  echo "    -> Removing bundled ATK..."
  rm -vf atk/glnxa64/*
    
  echo "    -> Removing bundled GTK2..."
  rm -vf os/glnxa64/*

  cd "${srcdir}/install/sys"
  echo "    -> Removing bundled FluxBox..."
  ln -vsf "/usr/bin/fluxbox" "fluxbox/glnxa64/bin/fluxbox"
  rm -f "fluxbox/glnxa64/fluxbox.rights"

  # echo "    -> Removing bundled OpenJade..."
  # ln -vsf "/usr/bin/openjade" "jade/bin/glnxa64/openjade"
  # rm -f "jade/bin/glnxa64/openjade.rights"

  echo "    -> Removing bundled OpenGL..."
  rm -vf "opengl/lib/glnxa64"/*.so*
  rm -f "opengl/lib/glnxa64"/*

  # echo "    -> Removing bundled GCC and Intel oneAPI..."
  # rm -vf "os/glnxa64"/*.so*
  # rm -rf "os/glnxa64"/*

  echo "    -> Removing bundled GCC..."
  rm -vrf "os/glnxa64"/{orig,*gcc*,*gfortran*,*quadmath*,*stdc++*}

  echo "    -> Removing bundled Hunspell en_US dictionary..."
  ln -vsf "/usr/share/myspell/dicts/en_US.aff" "share/dict/en_US.aff"
  ln -vsf "/usr/share/myspell/dicts/en_US.dic" "share/dict/en_US.dic"
  rm -f "share/dict/hunspell-dict-en_us.rights"

  echo "    -> Removing bundled Xvfb..."
  ln -vsf "/usr/bin/Xvfb" "Xvfb/glnxa64/bin/Xvfb"
  rm -f "Xvfb/glnxa64/Xvfb.rights"

  # cd "${srcdir}/install"
  # echo "  -> Fixing unnecessary permissions..."
  # find . -type f -executable \( -name '*.a' -o -name '*.rights' \) -exec \
  #   chmod -v 644 "{}" +

  # echo "  -> Removing insecure RPATH..."
  # find . -type f \( -name '*.so' -o -executable \) | while read -r f; do
  #   if file -b "$f" | grep -q '^ELF'; then
  #     patchelf --shrink-rpath --allowed-rpath-prefixes /,../ "$f"
  #   fi
  # done
}

package_matlab() {
  optdepends=(
    'glibc-locales: listed in the original depends'
    "java-${pkgbase}: required for certain products and features"
    # 'intel-oneapi-basekit'
    # 'intel-oneapi-compiler-shared-runtime'
    'libcups: printing support'
    'matlab-batch: start MATLAB non-interactively using a batch licensing token'
    'matlab-mpm: package manager'
    'patchelf: clear the executable stack after the install'
    'perl'
    'python-matlabengine: Python bindings'
  )
  provides=("${pkgname}-version=${_pkgver}")
  install="${pkgname}.install"

  cd "${srcdir}"
  echo "  -> Moving files from \$srcdir/ to \$pkgdir/ directly to save space..."
  # install -vdm755 "${pkgdir}/opt/MATLAB/${_pkgver}"
  install -vdm755 "${pkgdir}/opt/MATLAB"
  install -vdm777 "${pkgdir}/opt/MATLAB/${_pkgver}" # :(
  mv install/* "${pkgdir}/opt/MATLAB/${_pkgver}"

  echo "  -> Installing desktop file..."
  install -vDm644 "${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  echo "  -> Installing license..."
  install -vd "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -vsf "/opt/MATLAB/${_pkgver}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.txt"

  echo "  -> Installing symlinks..."
  install -vd "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  for bin in matlab matlab_jenv; do
    ln -vsf "/opt/MATLAB/${_pkgver}/bin/${bin}" "${bin}"
  done
  # owned by miktex, ...
  for bin in mex mexext; do
    ln -vsf "/opt/MATLAB/${_pkgver}/bin/${bin}" "${pkgbase}-${bin}"
  done
  for bin in MathWorksCrashReporter MathWorksLicenseDeactivation \
             MathWorksProductAuthorizer MathWorksProductUninstaller; do
    ln -vsf "/opt/MATLAB/${_pkgver}/bin/glnxa64/${bin}" "${bin}"
  done
}

package_java-matlab() {
  pkgdesc+=" (Java components)"
  # https://www.mathworks.com/support/requirements/openjdk.html
  depends=('java-environment-openjdk<=21' 'java-environment-openjdk>=8' "${pkgbase}=${epoch}:${pkgver}-${pkgrel}")
  provides=("${pkgname}-version=${_pkgver}")
  install="${pkgname}.install"

  cd "${srcdir}"
  echo "  -> Moving files from \$srcdir/ to \$pkgdir/ directly to save space..."
  # install -vdm755 "${pkgdir}/opt/MATLAB/${_pkgver}"
  install -vdm755 "${pkgdir}/opt/MATLAB"
  install -vdm777 "${pkgdir}/opt/MATLAB/${_pkgver}" # :(
  mv install-java/* "${pkgdir}/opt/MATLAB/${_pkgver}"

  echo "  -> Installing Java environment hook..."
  install -vDm644 "${pkgbase}_jenv.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgbase}_jenv.hook"
}

# echo "  -> Modifying MPM input settings..."
# cp "/usr/share/matlab-mpm/input/${_pkgver}.txt" "input.txt"
# sed -e "s|^# updateLevel=.*|updateLevel=0|g" \
#     -e "s|^# destinationFolder=.*|destinationFolder=${srcdir}/download|" \
#     -e "s|#product.${_product}$|product.${_product}|g" \
#     -i "input.txt"
# matlab-mpm download \
#   --inputfile ./input.txt
