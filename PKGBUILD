# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: David Strawn <isomarcte a__t gmail d__o__t c__o__m>
pkgname='metals'
pkgver='0.4.4'
pkgrel=1
epoch=
pkgdesc='Language Server For Scala'
url='https://scalameta.org/metals/'
arch=(any)
license=('Apache')
groups=()
depends=('java-environment=8' 'findutils' 'python')
makedepends=('sbt' 'sed' 'grep' 'coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/scalameta/${pkgname}/archive/v${pkgver}.tar.gz" 'metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')
noextract=()
md5sums=('dd997e9d688f22fe888966800a8ecb54'
         'd680f9edd2d896048f077cfb8b023ac5'
         'a883291ea3ae425c2c51b8310c7e4d1b'
         'dcb3e81e16b90333647d3bc052ce1ece'
         'b1d64c236e20f91fbbaa06a32dbb72e7'
         '2d7e382b962b705bcd5862f7182574fe')
sha1sums=('779b02af5af4a61f0449f4f0f8f7f7a30aa81ed7'
          'dafd89307afc8f75fa6c15903f84e400bf4d69a4'
          '9e0f0f83edd2dacc1053f66297e4f2c16618c48e'
          '214de4e3e38cffce813ba4eafcaf5ca641d95d50'
          'f3fd084eee605caa54fdeb3787dab7c359c75e32'
          '42ee89665251bf99935c91283750fe431f7713c4')
sha224sums=('043ea513e2493a2710db34a7a168591663f3a2e3bf379d1575b69193'
            '1638081b5bcca4919152528b1b6a340518fc326ed973e7832c80b41c'
            '4df1908182071dc2359d0ced412c7ab11ee81cd1d2f1039436776e92'
            'c78851f0f0f1839563ae32e9b9bfa1221165e93050036a52017a5fd9'
            '909f6b8caecfcb587c982e55f4ded982a8cb7493e79b621bb6dc9b34'
            'd4ae4cba4aaa5d2ad1baf45d7a4aa4dce894569ca5fba5e9d63f2a95')
sha256sums=('db394fe330c6ff2282b4c4a9b0194dcf8796039e13cfc493383d5f5becd3e865'
            '1277ef9c0cefdb769cfb4e6182a8aa55542cae9604b8f8f3dc98c909d8160572'
            'f8f895cb11d0b9af2b5320acf5862fb878f3ba94324bca35278b8aa31b32020c'
            '351f317247124f1ba05680520ca6cacb9c8ed9259d50505aa5127018bcad620d'
            'a60cfc3f0fc6fde8309ee7cd9c4a2bdf58668314cee8bdbc7938809e3de4e6c4'
            '1f587cc96100d560a43da35127ed1b5d2e36d14211f20e7931029abcab64d430')
sha384sums=('8942d46070eed792f48cb3744003759e620b7adbbe57f2b0c1291574d427d2462ca1a410cbf6081c2a1cfb253f6f2d7d'
            '090dce5f166dd210e22ded19eb0150cb35c390d07f2b93bb824cf4fadf4c188788246c264a59aab2f908258f81c0389d'
            'ae8b87a65ee897708134374f976d6b704d48f1f525e036de12cc793ab6960d2bcc176a57be886b0204ddba7c94b93214'
            '5c7aa52760f882910dca99f046c1b4384d36e72b40709a513345087ade967a0668a1b003e23320c57200fefb65772016'
            '71326bea2d7905bce5a1a4a495108af53b06cc162c86da46a62e85666ce7a78b25e7258219dc953da08743d050e86a60'
            '1235abb496221584c8b11b987460c7683ab160210b86d7a5acf117ad9c3315733795bc10af73844f731c20f1c25c64c7')
sha512sums=('e965b9dd43b1cf7f5d166839c8f89874eaea03c9e93f3098a011fd19ba59eab0bc781a30669eb16512cce2a17397aa98c05f84e4993428b3e546db68ba9e496e'
            '6cad8b806c5111604381d8ce760db9da8afd46312b8916678af65ace65e531b402e481e457bb7265bc3a3699f08b612b7b231755934af9bd7ee221b902e0dcd7'
            '95232be1232d3189a82cc0fe6af1d00fffd8334908e6d166143c69c0eda8e3a24674ce06d85e36213bc6a7044ae2f6a76d94a0715852aaf78b205a08112b403a'
            '1f1b034051fb65170bfd3f33cb8eb8a2f75018c1d32ef3a404e876427c3c94dd3beeb17d050a3898e803ad1f789b1b6f8258c0e81b4688b4fc17eb8d8f977522'
            '70a0cc5eb6b9a3b64a056524a1187626628e248f9fe419b00aaa1d665af482aa18c6e1c84570b1d1d196f0b143f2ccf91f26bc0c332e8f46120ce1cd5d68b676'
            '485f0360f0a25de9e397e44a987fdb2c5872de62568215f225572d0d0607dcab1ceb15d350b917c27c822caf89bdb24abf1433240ceca25867e0a6696d41f240')
validpgpkeys=()

build() {
    export COURSIER_CACHE="${srcdir}/.cache/coursier/v1"

    local -r _SBT_DIR="${srcdir}/.sbt"
    local -r _SBT_IVY="${srcdir}/.ivy2"
	  cd "$pkgname-$pkgver"
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile
}

check() {
    export COURSIER_CACHE="${srcdir}/.cache/coursier/v1"

    local -r _SBT_DIR="${srcdir}/.sbt"
    local -r _SBT_IVY="${srcdir}/.ivy2"
	  cd "$pkgname-$pkgver"
    ## Tests on most recent release currently fail
    # sbt test
}

package() {
    export COURSIER_CACHE='../.cache/coursier/v1'

    ## Constants ##
    local -r _SBT_DIR='../.sbt'
    local -r _SBT_IVY='../.ivy2'
    local -r _TARGET_DIR='/usr/share/java/metals'
    local -r _DEST_DIR="${pkgdir}${_TARGET_DIR}"
    local -r _BIN_DEST_DIR="${_DEST_DIR}/bin"
    local -r _LIB_DEST_DIR="${_DEST_DIR}/lib"
    local -r _JAR_DEST_DIR="${_DEST_DIR}/jars"
    local -r _USR_BIN="${pkgdir}/usr/bin"
    local -r _TEMP_FILE="$(mktemp)"
    local -r _LAUNCHER_SCRIPTS=('metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')

    ## Variables ##
    local LIB_NAME

    ## Change Into Correct Directory ##
	  pushd "$pkgname-$pkgver"

    ## Create lib And bin Directories ##
    install -d "$_LIB_DEST_DIR"
    install -d "$_BIN_DEST_DIR"

    ## Install Class Files And Jars ##

    ### Determine Dependencies ###

    # If you're reading this and you know of a better way to get all
    # the dependencies from SBT directly, please let me know.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" compile 'show metals/dependencyClasspath' 2>/dev/null | grep Attributed | sed 's/^[^\*]\+\* Attributed(\([^)]\+\).*/\1/g' > "$_TEMP_FILE"
    while read dep
    do
        local _SANATIZED_DEP="${dep##*${pkgname}-${pkgver}/}"
        # Sort out directories from modules from third-party jars.
        if [ -d "$_SANATIZED_DEP" ]
        then
            pushd "$_SANATIZED_DEP"
            cp -r ./* "${_LIB_DEST_DIR}/"
            popd
        else
            if [ ! -e "$_JAR_DEST_DIR" ]
            then
               install -d "${_JAR_DEST_DIR}"
            fi
            local _JAR_PATH="${dep##*/maven2}"

            install -D "$_SANATIZED_DEP" "${_JAR_DEST_DIR}${_JAR_PATH}"
        fi
    done<"$_TEMP_FILE"

    ## Install Metals Class Files ##

    install -d "${_DEST_DIR}/metals"
    pushd 'metals/target/scala-2.12/classes'
    cp -r ./*  "${_DEST_DIR}/metals/"
    popd

    ## Install And Symlink Launcher Scripts ##
    for launcher in ${_LAUNCHER_SCRIPTS[@]}
    do
        local _LINK_NAME="${launcher##*/}"
        _LINK_NAME="${launcher%%.*}"
        if [ ! -e "$_USR_BIN" ]
        then
            install -d "${_USR_BIN}"
        fi
        install -m 755 "../${launcher}" "$_BIN_DEST_DIR"
        ln -s "${_TARGET_DIR}/bin/${launcher}" "${_USR_BIN}/${_LINK_NAME}"
    done

    ## Ensure Correct Permissions ##

    chown root:root -R "$_DEST_DIR"
    chmod u=rwX -R "$_DEST_DIR"
    chmod u=rwX -R "$_BIN_DEST_DIR"
    chmod og=rX -R "$_DEST_DIR"

    ## Cleanup ##
    rm "$_TEMP_FILE"
    popd
}
