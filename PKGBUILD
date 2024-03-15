# This PKGBUILD build trunk version of clangd, and may apply some non-standard patches
#
# Applying patches controls via enviroment variables:
#
# Toggle all below patches
# CLANGD_DEFAULT_PATCH_STATE:
#   'n' - disable all patches
#   'y' - apply all patches
#
# Show Doxygen comments in hover (D134130)
# CLANGD_DOXYGEN:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve forwarded parameters in hover (D130265)
# CLANGD_RESOLVEFWDPARAMS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement textDocument/codeLens (D91930)
# It's also required patched `vscode-clangd` extension - https://github.com/lightmelodies/vscode-clangd/commit/46266b4adb106b5080f5c771099c777806a16adc
# CLANGD_CODELENS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Contextual postfix completions (D125224)
# Demo: https://asciinema.org/a/rxyoicX44ya2jLDpdbNj3rVcC
# CLANGD_POSTFIXCOMPLETION:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Extract Function: add hoisting support (D138499)
# CLANGD_EXTRACTFUNC:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add inlay hints for scructure paddings
# CLANGD_INLAYHINTSPADS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add hex formats in `size` and `offset` fileds on hover, when values more than 10
# CLANGD_HOVERINHEX:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show mask for bit fields (require CLANGD_HOVERBITFIELDS)
# CLANGD_HOVERBITFIELDSMASK:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show offset of virtual methods
# CLANGD_HOVERVIRTOFF:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show layout hover info everyhere
# CLANGD_HOVERLAYOUTEVERYHERE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Hide definition from hover info for functions and variables
# CLANGD_HOVERNODEFS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve the dependent type from its single instantiation (PR: 71279)
# CLANGD_RESOLVEDEPTYPE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Increase minimal limit for BlockEnd inlay-hints to 10 lines (default is 2)
# CLANGD_INLAYHINTSBLOCKEND:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Resolve includes in incomplete headers
# Limitations: AST for source must be loaded before open incomplete header
# CLANGD_RESOLVEINCHEADERS:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Add way to remove files from CDB via LSP
# No need in many cases. Useful only in multi project workspaces with patched client https://github.com/clangd/vscode-clangd/pull/487
# CLANGD_LSPREMOVEFROMCDB:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Show total record (class/struct/union) paddings in hover
# CLANGD_HOVERRECORDPAD:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Allow specifying what headers are always included via "" or <> (PR: 67749)
# CLANGD_CONFIG_INCLUDE_STYLE:
#   'n' - do not apply this patch
#   'y' - apply this patch
#
# Implement simple folding of preprocessor branches (PR: 80592)
# CLANGD_PREPROCESSOR_FOLDING:
#   'n' - do not apply this patch
#   'y' - apply this patch


: ${CLANGD_DEFAULT_PATCH_STATE:=n}
: ${CLANGD_DOXYGEN:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEFWDPARAMS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CODELENS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_POSTFIXCOMPLETION:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_EXTRACTFUNC:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSPADS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERINHEX:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERBITFIELDSMASK:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERVIRTOFF:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERLAYOUTEVERYHERE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERNODEFS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEDEPTYPE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_INLAYHINTSBLOCKEND:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_RESOLVEINCHEADERS:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_LSPREMOVEFROMCDB:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_HOVERRECORDPAD:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_CONFIG_INCLUDE_STYLE:=$CLANGD_DEFAULT_PATCH_STATE}
: ${CLANGD_PREPROCESSOR_FOLDING:=$CLANGD_DEFAULT_PATCH_STATE}

pkgname=clangd-opt-git
pkgver=19.r4743.gcb6ff746e0c7
pkgrel=1
pkgdesc='Trunk version of standalone clangd binary, with custom patches (look AUR page or PKGBUILD comments)'
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'zlib' 'zstd' 'libffi' 'libedit' 'ncurses'
             'libxml2' 'python-setuptools' 'python-psutil' 'python-sphinx')
options=('!strip')
source=("git+https://github.com/llvm/llvm-project.git#branch=main"
        'hover-doxygen-trunk.patch'
        'doxygen-extra-render-trunk.patch'
        'doxygen-more-fields.patch'
        'hover-resolve-forward-params.patch'
        'lsp-codelens.patch'
        'postfix-completion-trunk.patch'
        'refactor-extract-function.patch'
        'inlay-hints-paddings.patch'
        'hover-hex-formats.patch'
        'hover-bit-fields-mask.patch'
        'hover-virt-offset.patch'
        'hover-layout-everyhere.patch'
        'hover-no-defs.patch'
        'resolve-depend-type.patch'
        'inlay-hints-blockend-linelimit10.patch'
        'resolve-incomplete-header-includes.patch'
        'lsp-remove-files-from-cdb.patch'
        'hover-record-paddings.patch'
        'config-include-style.patch'
        'lsp-preprocessor-folding.patch')
sha256sums=('SKIP'
            '75b331257caa768c16687fd668ec2b8be62feb283892d601476c3e039f298a54'  # hover-doxygen-trunk
            '614dd012009facb502a7d44e07fc819aa95383c8917537c57968f76ba7881a94'  # doxygen-extra-render-trunk
            'b42d27929fcec3825711c13baf0c5a4ea0da33b8ff5e6f60c3c61d2f1f9525af'  # doxygen-more-fields
            '9e5dd128cedc8f37724d9c39c0f8f7efc826b0fd367f3a03c2564ff9f514ced7'  # hover-resolve-forward-params
            '71ff16d268122b0ade2d8e071cfb2110cdd75ac54ae67e36bc04be8bc077c121'  # lsp-codelens
            '221e6439df2ee1ca55f5925f9cc3133cb9fb5a256bdc68743e8d46747e7e85b7'  # postfix-completion-trunk
            'f719fb52edee98f54ba40786d2ecac6ef63f56797c8f52d4d7ce76a3825966eb'  # refactor-extract-function
            '2db1f319f850858ecebdcda1c1600d6dd523f171c5b019740298d43607d5fa00'  # inlay-hints-paddings
            'ba47bb7ac05487a5a083094247eaa369f89404924172a4af40147507b15b90aa'  # hover-hex-formats
            'e0c86d8cd1d1c4d68c07ed5843593a51607a268c39ccd76e7fe17bc168bf16f4'  # hover-bit-fields-mask
            '1b1ad88faa83b36dd68f63851a0fd6e07eed16595fcbffdc8a57b5c884f8a98c'  # hover-virt-offset
            '62e38f3074f39d51524b3d43aabb3991df97e43ea4a8c20e8073c479a41d1057'  # hover-layout-everyhere
            '94b328ea81eb615a90acf18a9a78733d77093deb12203683510fe4881bad95c6'  # hover-no-defs
            '4c610c149b6ca59ab5fad137a221d5d527a50f141fb782359cc2f9e5de7e68cd'  # resolve-depend-type
            '3365392bf7d95a02e2fb22dffbba011a3fa1179543426a2558b9ac61a300a7a7'  # inlay-hints-blockend-linelimit10
            '991fac650864bbf16832a8c8a0689ee44ef2959a79c9b950ff6200cb4c51beff'  # resolve-incomplete-header-includes
            '459bc42c7366305e562fa710551de909b581aa2358ca739585a0477dd06ebd6d'  # lsp-remove-files-from-cdb
            '0f5f7cc7f984988824bca66a2d08b0fa2b1b6ccdfcc1917e5cb0ed810036cfe7'  # hover-record-paddings
            'a05f3894ddb881ef77146da6955fc0612de684d7bc09a2ef9b9fc6aa750efcac'  # config-include-style
            '020e5509e2e13578abb6943ccf228feaa0083dd27cc611fa62c7cd3d700d82f7') # lsp-preprocessor-folding

pkgver() {
    cd llvm-project

    git describe --long --match llvmorg-\* | sed -r 's/llvmorg-([^-]*)-(init|rc[0-9]+)-(.*)/\1-r\3/;s/-/./g'
}

apply_patch() {
    echo -e "\033[0;34m  -> \033[1;37mApplying patch: $1\033[0m"
    patch -p1 -i ${srcdir}/$1.patch
}

prepare() {
    mkdir -p build
    cd ${srcdir}/llvm-project

    # Hover patches
    if [ "$CLANGD_DOXYGEN" != "n" ]; then
        apply_patch hover-doxygen-trunk
        apply_patch doxygen-extra-render-trunk
        apply_patch doxygen-more-fields
    fi
    if [ "$CLANGD_RESOLVEFWDPARAMS" != "n" ]; then
        apply_patch hover-resolve-forward-params
    fi
    if [ "$CLANGD_HOVERBITFIELDSMASK" != "n" ]; then
        apply_patch hover-bit-fields-mask
    fi
    if [ "$CLANGD_HOVERINHEX" != "n" ]; then
        apply_patch hover-hex-formats
    fi
    if [ "$CLANGD_HOVERVIRTOFF" != "n" ]; then
        apply_patch hover-virt-offset
    fi
    if [ "$CLANGD_HOVERLAYOUTEVERYHERE" != "n" ]; then
        apply_patch hover-layout-everyhere
    fi
    if [ "$CLANGD_HOVERNODEFS" != "n" ]; then
        apply_patch hover-no-defs
    fi
    if [ "$CLANGD_HOVERRECORDPAD" != "n" ]; then
        apply_patch hover-record-paddings
    fi

    # LSP patches
    if [ "$CLANGD_CODELENS" != "n" ]; then
        apply_patch lsp-codelens
    fi
    if [ "$CLANGD_LSPREMOVEFROMCDB" != "n" ]; then
        apply_patch lsp-remove-files-from-cdb
    fi
    if [ "$CLANGD_PREPROCESSOR_FOLDING" != "n" ]; then
        apply_patch lsp-preprocessor-folding
    fi

    # Code-completion patches
    if [ "$CLANGD_POSTFIXCOMPLETION" != "n" ]; then
        apply_patch postfix-completion-trunk
    fi

    # Refactoring patches
    if [ "$CLANGD_EXTRACTFUNC" != "n" ]; then
        apply_patch refactor-extract-function
    fi

    # Inlay hints patches
    if [ "$CLANGD_INLAYHINTSPADS" != "n" ]; then
        apply_patch inlay-hints-paddings
    fi
    if [ "$CLANGD_INLAYHINTSBLOCKEND" != "n" ]; then
        apply_patch inlay-hints-blockend-linelimit10
    fi

    # Resolve patches
    if [ "$CLANGD_RESOLVEDEPTYPE" != "n" ]; then
        apply_patch resolve-depend-type
    fi
    if [ "$CLANGD_RESOLVEINCHEADERS" != "n" ]; then
        apply_patch resolve-incomplete-header-includes
    fi

    # Config patches
    if [ "$CLANGD_CONFIG_INCLUDE_STYLE" != "n" ]; then
        apply_patch config-include-style
    fi
}

build() {
    cd build

    cmake -B . -S "${srcdir}/llvm-project/llvm" \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/opt/clangd \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
    cmake --build . --target clangd
}

package() {
    cd build

    cmake --install . --prefix "$pkgdir"/opt/clangd --component clangd
    # Install headers
    mkdir "$pkgdir"/opt/clangd/lib
    cp -r lib/clang "$pkgdir"/opt/clangd/lib/clang
}
